from google.cloud import storage, bigquery
import json
from datetime import datetime
from typing import Set, Dict, List

class DimCryptosInitializer:
    def __init__(self):
        self.project_id = "dst-crypto"
        self.dataset_id = "crypto_data_warehouse"
        self.bucket_name = "dst-crypto-raw-data-bucket"
        self.prefix = "crypto_data/"
        
        self.storage_client = storage.Client(project=self.project_id)
        self.bq_client = bigquery.Client(project=self.project_id)
        
    def extract_crypto_metadata(self) -> List[Dict]:
        """
        Parcourt tous les fichiers JSON du bucket et extrait les métadonnées
        de chaque crypto AUTOMATIQUEMENT
        """
        bucket = self.storage_client.bucket(self.bucket_name)
        blobs = bucket.list_blobs(prefix=self.prefix)
        
        cryptos_data = {}
        
        print("🔍 Scan des fichiers dans GCS...")
        
        for blob in blobs:
            if not blob.name.endswith('.json'):
                continue
                
            # Extraire le nom de la crypto depuis le chemin
            # Ex: crypto_data/BTC/BTC.json -> BTC
            parts = blob.name.split('/')
            if len(parts) < 3:  # Doit être crypto_data/SYMBOL/SYMBOL.json
                continue
                
            crypto_symbol = parts[1].upper()
            
            if crypto_symbol in cryptos_data:
                continue  # Déjà traité
            
            print(f"  📄 Analyse de {blob.name}...")
            
            try:
                # Télécharger et parser le JSON
                content = blob.download_as_text()
                data = json.loads(content)
                
                # Extraire les métadonnées de chaque source
                metadata = {
                    'crypto_key': crypto_symbol,
                    'binance_symbol': None,
                    'coingecko_id': None,
                    'cryptocompare_fsym': None,
                    'full_name': crypto_symbol,  # Par défaut = symbole
                    'date_min': None,
                    'date_max': None
                }
                
                # Binance
                if 'Binance' in data and data['Binance']:
                    first_item = data['Binance'][0]
                    metadata['binance_symbol'] = first_item.get('Symbol')
                    
                    # Calculer la plage de dates
                    timestamps = [item['Timestamp'] for item in data['Binance']]
                    if timestamps:
                        metadata['date_min'] = min(timestamps)
                        metadata['date_max'] = max(timestamps)
                
                # CoinGecko - EXTRACTION DU NOM COMPLET ICI !
                if 'CoinGecko' in data and data['CoinGecko']:
                    first_item = data['CoinGecko'][0]
                    coingecko_id = first_item.get('Coin')
                    metadata['coingecko_id'] = coingecko_id
                    
                    # 🎯 MAPPING AUTOMATIQUE DU NOM
                    # CoinGecko ID est souvent le nom en minuscules
                    # Ex: 'bitcoin' -> 'Bitcoin', 'ethereum' -> 'Ethereum'
                    if coingecko_id:
                        metadata['full_name'] = coingecko_id.replace('-', ' ').title()
                
                # CryptoCompare
                if 'CryptoCompare' in data and data['CryptoCompare']:
                    first_item = data['CryptoCompare'][0]
                    metadata['cryptocompare_fsym'] = first_item.get('Fsym')
                
                # Si on n'a pas de nom depuis CoinGecko, on utilise le symbole
                if metadata['full_name'] == crypto_symbol:
                    # Vérifier si Binance a un nom (rare mais possible)
                    if metadata['binance_symbol']:
                        # Extraire le nom depuis le symbol (ex: BTCUSDT -> BTC)
                        base = metadata['binance_symbol'].replace('USDT', '').replace('BUSD', '').replace('USD', '')
                        metadata['full_name'] = base
                
                cryptos_data[crypto_symbol] = metadata
                print(f"    ✅ {crypto_symbol} détecté → {metadata['full_name']}")
                
            except Exception as e:
                print(f"    ⚠️  Erreur sur {blob.name}: {e}")
                continue
        
        print(f"\n📊 Total: {len(cryptos_data)} cryptomonnaies trouvées\n")
        return list(cryptos_data.values())
    
    def insert_into_bigquery(self, cryptos: List[Dict]):
        """Insère les données dans dim_cryptos"""
        
        if not cryptos:
            print("❌ Aucune crypto à insérer")
            return
        
        table_id = f"{self.project_id}.{self.dataset_id}.dim_cryptos"
        
        # Préparer les rows pour BigQuery
        rows = []
        for crypto in cryptos:
            date_range = "N/A"
            if crypto['date_min'] and crypto['date_max']:
                date_range = f"{crypto['date_min'][:10]} to {crypto['date_max'][:10]}"
            
            rows.append({
                'crypto_key': crypto['crypto_key'],
                'coingecko_id': crypto['coingecko_id'],
                'binance_symbol': crypto['binance_symbol'],
                'cryptocompare_fsym': crypto['cryptocompare_fsym'],
                'full_name': crypto['full_name'],
                'data_range_approximation': date_range,
                'last_updated_at': datetime.utcnow().isoformat()
            })
        
        print(f"💾 Insertion de {len(rows)} lignes dans {table_id}...")
        
        errors = self.bq_client.insert_rows_json(table_id, rows)
        
        if errors:
            print(f"❌ Erreurs d'insertion:")
            for error in errors:
                print(f"  - {error}")
        else:
            print(f"✅ {len(rows)} cryptos insérées avec succès!\n")
            
            # Afficher TOUTES les cryptos insérées
            print("📋 Liste complète des cryptos insérées:")
            print("-" * 80)
            print(f"{'SYMBOL':<8} | {'NOM COMPLET':<30} | {'BINANCE':<15} | {'COINGECKO':<20}")
            print("-" * 80)
            
            for row in sorted(rows, key=lambda x: x['crypto_key']):
                print(f"{row['crypto_key']:<8} | {row['full_name']:<30} | "
                      f"{row['binance_symbol'] or 'N/A':<15} | "
                      f"{row['coingecko_id'] or 'N/A':<20}")
            
            print("-" * 80)
    
    def run(self):
        """Exécute le processus complet"""
        print("=" * 80)
        print("🚀 INITIALISATION AUTOMATIQUE DE dim_cryptos")
        print("=" * 80)
        print(f"Projet: {self.project_id}")
        print(f"Dataset: {self.dataset_id}")
        print(f"Bucket: gs://{self.bucket_name}/{self.prefix}")
        print("=" * 80 + "\n")
        
        # Étape 1: Extraction AUTOMATIQUE
        cryptos = self.extract_crypto_metadata()
        
        # Étape 2: Insertion
        if cryptos:
            self.insert_into_bigquery(cryptos)
            
            # Vérification finale
            query = f"""
            SELECT 
                COUNT(*) as total_cryptos,
                COUNT(DISTINCT crypto_key) as unique_keys,
                COUNT(binance_symbol) as with_binance,
                COUNT(coingecko_id) as with_coingecko,
                COUNT(cryptocompare_fsym) as with_cryptocompare
            FROM `{self.project_id}.{self.dataset_id}.dim_cryptos`
            """
            
            print("\n🔍 Vérification finale:")
            result = self.bq_client.query(query).result()
            for row in result:
                print(f"  - Total de cryptos: {row.total_cryptos}")
                print(f"  - Avec données Binance: {row.with_binance}")
                print(f"  - Avec données CoinGecko: {row.with_coingecko}")
                print(f"  - Avec données CryptoCompare: {row.with_cryptocompare}")
        
        print("\n" + "=" * 80)
        print("✅ INITIALISATION TERMINÉE - TOUTES LES CRYPTOS DÉTECTÉES AUTOMATIQUEMENT")
        print("=" * 80)


if __name__ == "__main__":
    initializer = DimCryptosInitializer()
    initializer.run()
