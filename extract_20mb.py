import json
import os

input_path = '/home/yanngarba/DST-DE/crypto_historical_data.json'
output_path = '/home/yanngarba/DST-DE/crypto_historical_data_10mb_4mc.json' # Nouveau nom de fichier de sortie

print(f"Chargement de {input_path}...")
with open(input_path, 'r') as f:
    data = json.load(f)

# Récupérer la taille originale du fichier pour estimer un ratio de départ
original_size_bytes = os.path.getsize(input_path)
original_size_mb = original_size_bytes / (1024 * 1024)
target_size_bytes = 4_000_000 # Cible de 4 millions de caractères (environ 4 Mo)

# Calculer un ratio de départ basé sur la taille originale et la taille cible.
# Nous supposons que la plupart des données volumineuses se trouvent dans les sections 'historical'.
# Si le fichier original est, par exemple, 200MB et que la cible est 4MB, le ratio initial serait 4/200 = 0.02
# Si le fichier original est 20MB et que la cible est 4MB, le ratio initial serait 4/20 = 0.2
if original_size_bytes > 0:
    # On prend une marge pour le ratio initial, car le découpage n'est pas linéaire
    # pour les parties non historiques et l'indentation JSON
    initial_ratio_estimate = (target_size_bytes / original_size_bytes) * 0.8
    if initial_ratio_estimate > 1.0: # Ne pas dépasser 1.0
        ratio = 1.0
    elif initial_ratio_estimate < 0.01: # Assurer un ratio minimal pour éviter des fichiers vides
        ratio = 0.01
    else:
        ratio = initial_ratio_estimate
else:
    ratio = 0.1 # Ratio par défaut si le fichier d'entrée est vide ou très petit

print(f"Taille du fichier original : {original_size_mb:.2f} Mo ({original_size_bytes} caractères)")
print(f"Cible : inférieur à 4 Mo (4 000 000 caractères)")
print(f"Découpage des listes avec un ratio de départ estimé à {ratio:.4f}...")

for root_key, root_val in data.items():
    # Nous ne voulons découper que les grands ensembles de données historiques
    if isinstance(root_val, dict) and 'historical' in root_key:
        print(f"Traitement de {root_key}...")
        for coin, entries in root_val.items():
            if isinstance(entries, list):
                original_len = len(entries)
                new_len = int(original_len * ratio)
                # S'assurer de conserver au moins une entrée si la liste n'était pas vide
                if new_len == 0 and original_len > 0:
                    new_len = 1
                
                root_val[coin] = entries[:new_len]
    else:
        print(f"Garde {root_key} tel quel.")

print(f"Sauvegarde dans {output_path}...")
with open(output_path, 'w') as f:
    # Utiliser separators=(',', ':') et supprimer indent=4 pour minimiser la taille du fichier.
    # L'indentation ajoute beaucoup de caractères blancs.
    json.dump(data, f, separators=(',', ':'))

size = os.path.getsize(output_path)
print(f"Terminé. Nouvelle taille du fichier : {size / (1024*1024):.2f} Mo ({size} caractères)")

print("\n--- Instructions d'ajustement ---")
print(f"Votre objectif est une taille inférieure à 4.00 Mo ({target_size_bytes} caractères).")
print(f"La taille actuelle du fichier est de {size / (1024*1024):.2f} Mo ({size} caractères).")

if size > target_size_bytes:
    print(f"Le fichier est encore trop grand. Réduisez le 'ratio' actuel ({ratio:.4f}) dans le script.")
    print("Essayez de le diviser par la proportion de l'excès. Par exemple, si vous avez 8 Mo (2x trop grand),")
    print("divisez le ratio par 2. Nouveau ratio = ratio actuel / (taille actuelle / taille cible).")
    print(f"Ratio suggéré : {ratio * (target_size_bytes / size):.4f}")
elif size < target_size_bytes and size > target_size_bytes * 0.7: # Si la taille est proche de la cible, on est bon
    print("La taille du fichier est bonne et proche de votre cible de 4 Mo.")
else:
    print(f"Le fichier est plus petit que 4 Mo. Si vous souhaitez conserver plus de données, vous pouvez augmenter le 'ratio' actuel ({ratio:.4f}) un peu.")
    print("Nouveau ratio = ratio actuel * (taille cible / taille actuelle).")
    print(f"Ratio suggéré : {ratio * (target_size_bytes / size):.4f}")

print("\nNote: L'utilisation de `separators=(',', ':')` dans `json.dump` supprime l'indentation et les espaces,")
print("ce qui réduit significativement la taille du fichier. Si vous avez besoin d'un fichier lisible,")
print("vous pouvez remettre `indent=4`, mais la taille sera plus grande pour le même `ratio`.")
