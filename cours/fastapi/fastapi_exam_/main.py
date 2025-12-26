import pandas as pd
from fastapi import FastAPI, HTTPException, Depends, status
from fastapi.security import HTTPBasic, HTTPBasicCredentials
from pydantic import BaseModel, Field
import random
import json
from typing import List, Dict, Optional

# Nom de la variable pour l'instance FastAPI()
app = FastAPI(
    title="API de Questionnaires",
    description="API pour générer et gérer des questions de QCM.",
    version="1.0.0",
)

# Chargement des données des questions depuis le fichier CSV
questions_df = pd.read_csv("questions.csv")

# ------------------------
# --- Authentification ---
# ------------------------
security = HTTPBasic()

# Utilisateurs pour l'authentification basique générale
API_USERS = {
    "alice": "wonderland",
    "bob": "builder",
    "clementine": "mandarine"
}

# Informations d'identification admin spécifiques pour /create_question (dans le payload)
ADMIN_USERNAME_PAYLOAD = "admin"
ADMIN_PASSWORD_PAYLOAD = "4dm1N"

def verify_credentials(credentials: HTTPBasicCredentials = Depends(security)):
    """
    Dépendance pour l'authentification basique HTTP.
    Vérifie les informations d'identification contre API_USERS.
    """
    username = credentials.username
    password = credentials.password
    if not (username in API_USERS and API_USERS[username] == password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Informations d'authentification invalides.",
            headers={"WWW-Authenticate": "Basic"},
        )
    return username # Retourne le nom d'utilisateur si l'authentification est réussie

# ------------------------
# --- Questionnaires ---
# ------------------------

# 1. /verification que l'API est fonctionnelle
@app.get("/verify", summary="Vérifie que l'API est fonctionnelle.")
async def verify_api():
    """
    Endpoint pour vérifier l'état de fonctionnement de l'API.
    Retourne un message simple confirmant que l'API est active.
    """
    return {"message": "L'API est fonctionnelle."}

# 2. /generate_quiz 

class QuizRequest(BaseModel):
    """
    Modèle pour la charge utile de la requête de génération de QCM.
    """
    test_type: str = Field(..., description="Le type de test souhaité (ex: 'Test de validation').")
    categories: List[str] = Field(..., description="Une liste des catégories de questions souhaitées.")
    number_of_questions: int = Field(..., ge=5, le=20, description="Le nombre de questions à inclure (5, 10 ou 20).")

class QuestionResponse(BaseModel):
    """
    Modèle pour le format d'une question retournée dans la réponse.
    """
    question: str
    subject: str
    correct: List[str]  # Les réponses correctes peuvent être une liste
    use: str
    responseA: str
    responseB: str
    responseC: Optional[str] = None # Rendre optionnel
    responseD: Optional[str] = None # Rendre optionnel

# --- Endpoint /generate_quiz ---
@app.post("/generate_quiz", response_model=List[QuestionResponse], summary="Génère un QCM basé sur les paramètres fournis.")
async def generate_quiz(
    request: QuizRequest,
    username: str = Depends(verify_credentials) # L'authentification est requise
):
    """
    Génère un QCM en fonction du type de test, des catégories et du nombre de questions spécifiés.
    Les questions sont sélectionnées aléatoirement parmi celles disponibles.

    - **test_type**: Le type de test (e.g., "Test de validation", "Total Bootcamp").
    - **categories**: Une liste de catégories (e.g., ["Docker", "BDD"]).
    - **number_of_questions**: Le nombre de questions souhaité (5, 10 ou 20).

    Nécessite une authentification basique dans les headers.
    """
    if not questions_df.empty:
        # Filtrer par type de test
        filtered_df = questions_df[questions_df['use'] == request.test_type]

        # Filtrer par catégories (s'assurer que la colonne 'subject' existe et n'est pas vide)
        if not request.categories:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Au moins une catégorie doit être fournie."
            )
        filtered_df = filtered_df[filtered_df['subject'].isin(request.categories)]

        # Vérifier si des questions correspondent aux critères
        if filtered_df.empty:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Aucune question ne correspond aux critères de sélection."
            )

        # Vérifier si le nombre de questions est valide
        if request.number_of_questions not in [5, 10, 20]:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Le nombre de questions doit être 5, 10 ou 20."
            )

        # Si le nombre de questions demandé est supérieur au nombre disponible
        if len(filtered_df) < request.number_of_questions:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Pas assez de questions disponibles ({len(filtered_df)}) pour les critères sélectionnés. Demandé: {request.number_of_questions}."
            )
        
        # Sélection aléatoire des questions et SUPPRESSION de la colonne 'remark'
        columns_for_response = [
            'question', 'subject', 'correct', 'use',
            'responseA', 'responseB', 'responseC', 'responseD'
        ]

        selected_questions_df = filtered_df.sample(n=request.number_of_questions)[columns_for_response]
        selected_questions = selected_questions_df.to_dict(orient='records')

        # Nettoyage des données pour le retour
        quiz_questions = []
        for q_dict in selected_questions:
            # Vérification que 'correct' est une liste
            original_correct_value = q_dict['correct']
            
            # Gérer les valeurs NaN si 'correct' est vide
            if pd.isna(original_correct_value):
                q_dict['correct'] = []
            else:
                try:
                    # 1. Tentative de charger comme JSON 
                    parsed_correct = json.loads(str(original_correct_value))
                    if isinstance(parsed_correct, list):
                        # Assure que chaque élément est une chaîne propre
                        q_dict['correct'] = [str(item).strip() for item in parsed_correct if str(item).strip()]
                    else:
                        # Traitement comme une seule valeur, si ce n'est pas une liste après JSON.loads
                        q_dict['correct'] = [str(parsed_correct).strip()]
                except (json.JSONDecodeError, TypeError):
                    # 2. Si ce n'est pas un JSON valide, traitez comme une chaîne séparée par des virgules
                    if isinstance(original_correct_value, str):
                        # D'abord, tentative de diviser par virgule, puis par espace si une seule partie reste et contient des espaces
                        parts = [s.strip() for s in original_correct_value.split(',') if s.strip()]
                        final_parts = []
                        for part in parts:
                            if ' ' in part and len(part.split()) > 1: # Si une partie contient des espaces et plusieurs mots
                                final_parts.extend([s.strip() for s in part.split(' ') if s.strip()])
                            else:
                                final_parts.append(part)
                        q_dict['correct'] = final_parts
                    else:
                        q_dict['correct'] = [str(original_correct_value).strip()] if str(original_correct_value).strip() else []

            for key in ['responseC', 'responseD']:
                if pd.isna(q_dict.get(key)): # Vérification si la valeur est NaN
                    q_dict[key] = None      # Si c'est NaN, la remplace par None

            # Conversion en modèle Pydantic pour validation et types corrects
            quiz_questions.append(QuestionResponse(**q_dict))

        return quiz_questions
    else:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Les données des questions n'ont pas été chargées."
        )
    
# 3. /create_question   
class CreateQuestionPayload(BaseModel):
    """
    Modèle pour la charge utile de la requête de création de question.
    """
    admin_username: str = Field(..., description="Nom d'utilisateur de l'administrateur pour l'authentification.")
    admin_password: str = Field(..., description="Mot de passe de l'administrateur pour l'authentification.")
    question: str = Field(..., description="Le texte de la question.")
    subject: str = Field(..., description="Le sujet ou la catégorie de la question (ex: 'BDD', 'Docker').")
    correct: List[str] = Field(..., description="Une liste des réponses correctes.")
    use: str = Field(..., description="Le type d'utilisation de la question (ex: 'Test de validation', 'Total Bootcamp').")
    responseA: str = Field(..., description="Option de réponse A.")
    responseB: str = Field(..., description="Option de réponse B.")
    responseC: Optional[str] = Field(None, description="Option de réponse C (optionnel).")
    responseD: Optional[str] = Field(None, description="Option de réponse D (optionnel).")

@app.post("/create_question", summary="Crée une nouvelle question par un utilisateur admin.")
async def create_question(payload: CreateQuestionPayload):
    """
    Crée une nouvelle question dans la base de données (DataFrame).
    Nécessite des informations d'authentification admin spécifiques
    incluses directement dans le corps de la requête (payload).
    """
    global questions_df # Pour modifier la variable globale questions_df

    # 1. Vérification des informations d'identification admin du payload
    if not (payload.admin_username == ADMIN_USERNAME_PAYLOAD and payload.admin_password == ADMIN_PASSWORD_PAYLOAD):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Authentification admin échouée. Informations d'identification invalides."
        )

    # 2. Préparation des données de la nouvelle question
    new_question_data = payload.model_dump()
    # Supprime les infos d'authentification du dictionnaire avant d'ajouter à questions_df
    del new_question_data['admin_username']
    del new_question_data['admin_password']

    # Sérialisation de la liste 'correct' en chaîne JSON pour le stockage dans le CSV/DataFrame
    new_question_data['correct'] = json.dumps(new_question_data['correct'])

    # 3. Ajout de la nouvelle question au DataFrame
    try:
        if questions_df is None or questions_df.empty:
            questions_df = pd.DataFrame([new_question_data])
        else:
            questions_df = pd.concat([questions_df, pd.DataFrame([new_question_data])], ignore_index=True)

        # 4. Sauvegarder le DataFrame mis à jour dans le CSV
        questions_df.to_csv("questions.csv", index=False)

    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Erreur lors de l'ajout de la question au DataFrame: {str(e)}"
        )

    return {"message": "Question créée avec succès."}