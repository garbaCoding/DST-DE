from pprint import pprint
from datetime import datetime
from pymongo import MongoClient
import re

# Connexion à la base
#(a) Pour se connecter à MongoDB via pymongo
client = MongoClient(
    host = "127.0.0.1",
    port = 27017,
    username = "datascientest",
    password = "dst123"
)

#(b) Afficher la liste des bases de données disponibles
print("Liste des bases de données: ", client.list_database_names())
print("************************************************************************")

#(c) Afficher la liste des collections de la base de données "sample"
sample = client["sample"]
print("Liste des collections de la base de données sample: ", sample.list_collection_names())
print("************************************************************************")

#(d) Afficher un des documents de cette collection.
pprint(sample["books"].find_one())
print("************************************************************************")

#(e) Afficher le nombre de documents dans cette collection
books = sample["books"]
print("Nombre de livres dans la collection books: ", books.count_documents({}))
print("************************************************************************")

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

#Exploration de la collection "books"
print("(a) Afficher le nombre de livres avec plus de 400 pages, affichez ensuite le nombre de livres ayant plus de 400 pages ET qui sont publiés.")
#Nombre de livres avec plus de 400 pages
nb_plus_400 = books.count_documents({ "pageCount": { "$gt": 400 } })
#Nombre de livres avec plus de 400 pages ET status = 'PUBLISH'
nb_plus_400_publish = books.count_documents({
    "pageCount": { "$gt": 400 },
    "status": "PUBLISH"
})

print("Livres > 400 pages: ", nb_plus_400)
print("Livres > 400 pages et publiés: ", nb_plus_400_publish)
print("************************************************************************")

print("(b) Afficher le nombre de livres ayant le mot-clé Android dans leur description (brève ou longue)")

nb_android = books.count_documents({
    "$or": [
        { "shortDescription": { "$regex": "Android", "$options": "i" } },
        { "longDescription" : { "$regex": "Android", "$options": "i" } }
    ]
})

print(f"Nombre de livres contenant 'Android' dans la description : {nb_android}")
print("************************************************************************")

print("(c) : Vous devez grouper tous les documents en un à l'aide de l'opérateur $group.")
pipeline = [
    {
        # On regroupe tous les documents en un seul document
        "$group": {
            "_id": None,
            # On crée un set de toutes les catégories à l'index 0
            "categories_index_0": {
                "$addToSet": {
                    "$arrayElemAt": ["$categories", 0]
                }
            },
            # On crée un set de toutes les catégories à l'index 1
            "categories_index_1": {
                "$addToSet": {
                    "$arrayElemAt": ["$categories", 1]
                }
            }
        }
    },
    {
        # On masque le _id pour ne garder que les catégories
        "$project": {
            "_id": 0,
            "categories_index_0": 1,
            "categories_index_1": 1
        }
    }
]

result = list(books.aggregate(pipeline))[0]
pprint(result)
print("************************************************************************")

print("(d) Afficher le nombre de livres qui contiennent des noms de langages suivant dans leur description longue : Python, Java, C++, Scala.")
pattern = re.compile(r"Python|Java|C\+\+|Scala", re.IGNORECASE)

nb_langages = books.count_documents({
    "longDescription": pattern
})

print("Nombre de livres contenant un des langages dans la description longue : ", nb_langages)
print("************************************************************************")

print("(e) Afficher diverses informations statistiques sur notre bases de données : nombre maximal, minimal, et moyen de pages par catégorie.")
pipeline_categories = [
    # On « unwind » le tableau categories : un document par valeur de categories
    { "$unwind": "$categories" },

    # On regroupe par valeur de catégorie, et on calcule max, min, avg et nombre de livres
    { "$group": {
        "_id": "$categories",
        "maxPages": { "$max": "$pageCount" },
        "minPages": { "$min": "$pageCount" },
        "avgPages": { "$avg": "$pageCount" },
        "count":    { "$sum": 1 }              # optionnel : nombre de livres par catégorie
    }},

    # Restructuration du document
    { "$project": {
        "_id":       0,
        "category":  "$_id",
        "maxPages":  1,
        "minPages":  1,
        "avgPages":  { "$round": ["$avgPages", 1] },
        "count":     1
    }},
]

result_categories = list(books.aggregate(pipeline_categories))
pprint(result_categories)
print("************************************************************************")

print("(f) Créer de nouvelles variables en extrayant info depuis l'attribut dates : année, mois, jour.") 
pipeline_date = [
    # On ne garde que les livres publiés après 2009
    {
        "$match": {
            "publishedDate": {
                "$gt": datetime(2009, 12, 31)
            }
        }
    },
    # Création trois nouveaux champs year, month, day
    {
        "$project": {
            "_id": 0,               
            "title": 1,             
            "year":  { "$year":  "$publishedDate"   },
            "month": { "$month": "$publishedDate"   },
            "day":   { "$dayOfMonth": "$publishedDate" }
        }
    },
    # Affichage des 20 premiers résultats
    { "$limit": 20 }
]

result_date = list(books.aggregate(pipeline_date))
pprint(result_date)
print("************************************************************************")

# On regarde quel est le nombre maximimum d'auteurs par livre
max_len_doc = books.aggregate([
    { "$project": { "len": { "$size": "$authors" } } },
    { "$group":   { "_id": None, "maxLen": { "$max": "$len" } } }
]).next()
max_authors = max_len_doc["maxLen"]
print("Nombre maximum d'auteurs par livre : ", max_authors)

pipeline_auteurs = [
    #Tri chronologique
    { "$sort": { "publishedDate": 1 } },

    #Projection des champs author_1, author_2, author_3
    { "$project": {
        "_id":       0,
        "title":     1,
        "publishedDate": 1,
        "author_1": { "$arrayElemAt": ["$authors", 0] },
        "author_2": { "$arrayElemAt": ["$authors", 1] },
        "author_3": { "$arrayElemAt": ["$authors", 2] },
        "author_4": { "$arrayElemAt": ["$authors", 3] },
        "author_5": { "$arrayElemAt": ["$authors", 4] },
        "author_6": { "$arrayElemAt": ["$authors", 5] },
        "author_7": { "$arrayElemAt": ["$authors", 6] },
        "author_8": { "$arrayElemAt": ["$authors", 7] },
    }},

    #On ne garde que 20 documents
    { "$limit": 20 }
]

result_auteurs = list(books.aggregate(pipeline_auteurs))
pprint(result_auteurs)
print("************************************************************************")

print("(h) Afficher le nombre de publications pour les 10 premiers auteurs les plus prolifiques")
pipeline_publications = [
    #Ajout du champ premier_auteur (premier auteur du tableau authors)
    { "$project": {
        "premier_auteur": { "$arrayElemAt": ["$authors", 0] },
    }},
    #Somme des livres par premier auteur
    { "$group": {
        "_id": "$premier_auteur",
        "nb_publications": { "$sum": 1 }
    }},
    #Tri décroissant sur le nombre de publications
    { "$sort": { "nb_publications": -1 } },
    #On garde les 10 premiers auteurs les plus prolifiques
    { "$limit": 10 }
]

result_publications = list(books.aggregate(pipeline_publications))
pprint(result_publications)
print("************************************************************************")

print("(i) [OPTIONNEL] Afficher la distribution du nombre d'auteurs")
pipeline_nb_auteurs = [
    # Création d’une colonne nb_auteurs = taille du tableau authors
    { "$project": { "nb_auteurs": { "$size": "$authors" } } },
    # Groupe par nb_auteurs et compte les livres pour chaque taille
    { "$group": {
        "_id": "$nb_auteurs",
        "nb_livres": { "$sum": 1 }
    }}
]

result_nb_auteurs = list(books.aggregate(pipeline_nb_auteurs))
pprint(result_nb_auteurs)
print("************************************************************************")

print("(j) [OPTIONNEL] Afficher l'occurence de chaque auteur selon son index dans l'attribut \"authors\".")
pipeline_occurence = [
    # Unwind authors et récupèration de l'index dans le tableau
    { "$unwind": { "path": "$authors", "includeArrayIndex": "author_index" } },

    # On ne garde que les auteurs présents et non vides
    { "$match": {
        "authors": { "$ne": None },
        "authors": { "$ne": "" }
    }},

    # Groupage par auteur + index et compsomme des occurrences
    { "$group": {
        "_id": {
            "author": "$authors",
            "index": "$author_index"
        },
        "occurrence": { "$sum": 1 }
    }},

    # Tri par occurrence décroissante
    { "$sort": { "occurrence": -1 } },

    # Limiter à 20 résultats
    { "$limit": 20 }
]

result_occurence = list(books.aggregate(pipeline_occurence))
pprint(result_occurence)
print("************************************************************************")