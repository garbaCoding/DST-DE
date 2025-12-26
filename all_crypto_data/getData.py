import requests
import pandas as pd
import json
import time
from datetime import datetime, timedelta
import os # Importation du module os pour les opérations sur les fichiers/répertoires

# --- 1. Configuration des APIs ---
BINANCE_BASE_URL = "https://api.binance.com/api/v3"
COINGECKO_BASE_URL = "https://api.coingecko.com/api/v3"
CRYPTOCOMPARE_BASE_URL = "https://min-api.cryptocompare.com"

# Fichier JSON contenant les données des cryptos à charger
script_dir = os.path.dirname(os.path.abspath(__file__))
COINGECKO_TOP_CRYPTOS_FILE = os.path.join(script_dir, "100most.json") 

# Clé API CoinGecko (IMPORTANT : remplacez par votre clé réelle si vous en avez une)
# Sans clé, l'API fonctionne avec des limites de débit très strictes (50 requêtes/minute sur le tier gratuit).
# Avec une clé gratuite, vous avez 10-50 requêtes/seconde.
COINGECKO_API_KEY = "CG-Mh1tJJ7kZt8U8wvGTME1wsJj" # <<< REMPLACEZ CECI PAR VOTRE VRAIE CLÉ API COINGECKO

# Devise(s) de comparaison (sera splitée en liste pour CoinGecko)
VS_CURRENCIES = "usd,eur" 

# Période historique (par exemple, les 3 dernières années)
END_DATE = datetime.now()
START_DATE_3_YEARS_AGO = END_DATE - timedelta(days=3 * 365) # Approximation pour 3 ans

# Répertoire RACINE pour les fichiers JSON individuels (contiendra des sous-répertoires par devise)
ROOT_OUTPUT_DIR = "all_crypto_data"

# --- Fonction pour construire le dictionnaire CRYPTOS à partir d'un fichier JSON CoinGecko ---
def build_cryptos_from_coingecko_json(json_file_path: str, top_n: int = None) -> dict:
    """
    Construit le dictionnaire CRYPTOS à partir d'un fichier JSON de données CoinGecko
    (généralement le résultat de l'API /coins/markets).

    Args:
        json_file_path (str): Le chemin vers le fichier JSON de CoinGecko.
        top_n (int, optional): Le nombre maximum de cryptos à inclure dans le dictionnaire.
                               Si None, toutes les cryptos du fichier sont incluses.

    Returns:
        dict: Le dictionnaire CRYPTOS formaté pour le script de collecte.
              Retourne un dictionnaire vide en cas d'erreur ou de fichier non trouvé.
    """
    cryptos_dict = {}
    try:
        with open(json_file_path, 'r', encoding='utf-8') as f:
            coingecko_data = json.load(f)

        if not isinstance(coingecko_data, list) or not coingecko_data:
            print("Erreur: Le fichier JSON ne contient pas une liste de cryptos valide.")
            return {}

        for i, crypto_info in enumerate(coingecko_data):
            if top_n is not None and i >= top_n:
                break # Limite au top_n

            coingecko_id = crypto_info.get("id")
            symbol = crypto_info.get("symbol") # ex: "btc", "eth"

            # Assurez-vous que l'ID CoinGecko et le symbole existent et ne sont pas vides
            if coingecko_id and symbol and coingecko_id.strip() and symbol.strip():
                upper_symbol = symbol.upper()

                # Il est crucial d'éviter d'ajouter USDT ou d'autres stablecoins comme un crypto à collecter contre USDT/USD.
                # Nous ignorons également les tokens synthétiques ou wrap-tokens qui utilisent des symboles comme "wbtc"
                # mais dont l'ID est différent de l'original (ex: "arbitrum-bridged-wbtc-arbitrum-one" au lieu de "bitcoin")
                if upper_symbol in ["USDT", "USD", "EUR"] or "bridged" in coingecko_id: # Ajout de EUR au cas où
                    print(f"Avertissement: Ignorance de {coingecko_id} ({upper_symbol}) car c'est une devise stable ou un token ponté non-pertinent pour la collecte primaire.")
                    continue
                
                binance_symbol = f"{upper_symbol}USDT"
                cryptocompare_fsym = upper_symbol
                cryptocompare_tsym = "USDT" # Hypothèse de la paire de base pour CryptoCompare

                cryptos_dict[upper_symbol] = {
                    "binance_symbol": binance_symbol,
                    "coingecko_id": coingecko_id,
                    "cryptocompare_fsym": cryptocompare_fsym,
                    "cryptocompare_tsym": cryptocompare_tsym
                }
            else:
                print(f"Avertissement: Crypto ignorée en raison de l'absence d'ID ou de symbole valide: {crypto_info.get('name', 'Inconnu')}")

    except FileNotFoundError:
        print(f"Erreur: Le fichier '{json_file_path}' n'a pas été trouvé.")
    except json.JSONDecodeError:
        print(f"Erreur: Impossible de décoder le JSON du fichier '{json_file_path}'.")
    except Exception as e:
        print(f"Une erreur inattendue est survenue lors de la construction de CRYPTOS: {e}")

    return cryptos_dict

# --- 2. Fonctions d'aide pour la récupération des données ---

# Fonction pour CoinGecko (prix actuel)
def get_coingecko_current_price(coin_ids, vs_currencies):
    url = f"{COINGECKO_BASE_URL}/simple/price"
    params = {
        "ids": ",".join(coin_ids),
        "vs_currencies": ",".join(vs_currencies)
    }
    # Utilisation de x_cg_demo_api_key pour la clé gratuite
    if COINGECKO_API_KEY and COINGECKO_API_KEY != "VOTRE_CLE_API_COINGECKO":
        params["x_cg_demo_api_key"] = COINGECKO_API_KEY
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Erreur lors de la récupération des prix actuels CoinGecko: {e}")
        return None

# MODIFIÉE : Fonction pour CoinGecko (données de marché historiques)
def get_coingecko_market_chart(coin_id, vs_currencies_list, days, interval="daily"):
    all_market_data = {}
    for vs_currency_single in vs_currencies_list:
        url = f"{COINGECKO_BASE_URL}/coins/{coin_id}/market_chart"
        params = {
            "vs_currency": vs_currency_single,
            "days": days,
            "interval": interval
        }
        # Utilisation de x_cg_demo_api_key pour la clé gratuite
        if COINGECKO_API_KEY and COINGECKO_API_KEY != "VOTRE_CLE_API_COINGECKO":
            params["x_cg_demo_api_key"] = COINGECKO_API_KEY
        
        try:
            print(f"  Appel CoinGecko pour {coin_id} en {vs_currency_single} ({days} jours)...")
            response = requests.get(url, params=params)
            response.raise_for_status() # Lève une exception pour les codes d'état HTTP 4xx ou 5xx
            data = response.json()
            all_market_data[vs_currency_single] = data
            time.sleep(1) # Pause pour respecter les limites de débit entre les appels pour différentes devises
        except requests.exceptions.RequestException as e:
            print(f"Erreur lors de la récupération des données de marché CoinGecko pour {coin_id} en {vs_currency_single}: {e}")
            all_market_data[vs_currency_single] = None # Indiquer l'échec pour cette devise
    return all_market_data

# Fonction pour Binance (données OHLCV historiques)
def get_binance_klines(symbol, interval, start_str, end_str=None, limit=1000):
    url = f"{BINANCE_BASE_URL}/klines"
    params = {
        "symbol": symbol,
        "interval": interval,
        "startTime": int(datetime.strptime(start_str, "%Y-%m-%d").timestamp() * 1000),
        "limit": limit
    }
    if end_str:
        params["endTime"] = int(datetime.strptime(end_str, "%Y-%m-%d").timestamp() * 1000)
    
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Erreur lors de la récupération des klines Binance pour {symbol}: {e}")
        return None

# Fonction pour CryptoCompare (données OHLCV historiques)
# Note: CryptoCompare nécessite un compte et une clé API pour des limites plus élevées
def get_cryptocompare_histoday(fsym, tsym, limit=2000, aggregate=1, toTs=None):
    url = f"{CRYPTOCOMPARE_BASE_URL}/data/v2/histoday"
    params = {
        "fsym": fsym,
        "tsym": tsym,
        "limit": limit,
        "aggregate": aggregate
    }
    # CryptoCompare API Key - Ajoutez votre clé si vous en avez une.
    # params["api_key"] = "VOTRE_CLE_API_CRYPTOCOMPARE"
    if toTs:
        params["toTs"] = toTs
    
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Erreur lors de la récupération des données historiques CryptoCompare pour {fsym}/{tsym}: {e}")
        return None

# --- 3. Fonctions de pré-traitement des données ---

# Pré-traitement Binance
def process_binance_klines(klines, symbol):
    df = pd.DataFrame(klines, columns=[
        'Open time', 'Open', 'High', 'Low', 'Close', 'Volume',
        'Close time', 'Quote asset volume', 'Number of trades',
        'Taker buy base asset volume', 'Taker buy quote asset volume', 'Ignore'
    ])
    df['Timestamp'] = pd.to_datetime(df['Open time'], unit='ms')
    df['Symbol'] = symbol
    df = df[['Timestamp', 'Symbol', 'Open', 'High', 'Low', 'Close', 'Volume']].astype({
        'Open': float, 'High': float, 'Low': float, 'Close': float, 'Volume': float
    })
    return df

# MODIFIÉE : Pré-traitement CoinGecko (données de marché historiques)
def process_coingecko_market_chart(data_by_currency, coin_id, vs_currencies_list):
    processed_data_by_currency = {}
    for vs_currency in vs_currencies_list:
        currency_data = data_by_currency.get(vs_currency)
        if not currency_data:
            continue

        prices = currency_data.get('prices', [])
        market_caps = currency_data.get('market_caps', [])
        total_volumes = currency_data.get('total_volumes', [])

        df_prices = pd.DataFrame(prices, columns=['Timestamp', 'Price'])
        df_market_caps = pd.DataFrame(market_caps, columns=['Timestamp', 'MarketCap'])
        df_total_volumes = pd.DataFrame(total_volumes, columns=['Timestamp', 'TotalVolume'])

        # Convert timestamps to datetime objects
        df_prices['Timestamp'] = pd.to_datetime(df_prices['Timestamp'], unit='ms')
        df_market_caps['Timestamp'] = pd.to_datetime(df_market_caps['Timestamp'], unit='ms')
        df_total_volumes['Timestamp'] = pd.to_datetime(df_total_volumes['Timestamp'], unit='ms')

        # Fusionner les DataFrames
        df_merged = pd.merge(df_prices, df_market_caps, on='Timestamp', how='outer')
        df_merged = pd.merge(df_merged, df_total_volumes, on='Timestamp', how='outer')

        df_merged = df_merged.sort_values('Timestamp').reset_index(drop=True)
        
        # Ajouter le coin_id et la devise de comparaison pour la clarté
        df_merged['Coin'] = coin_id
        df_merged['VS_Currency'] = vs_currency

        processed_data_by_currency[vs_currency] = df_merged.to_dict(orient='records')
    return processed_data_by_currency

# Pré-traitement CryptoCompare
def process_cryptocompare_histoday(data, fsym, tsym):
    if not data or 'Data' not in data or 'Data' not in data['Data'] or not data['Data']['Data']:
        return pd.DataFrame() # Retourne un DataFrame vide
        
    df = pd.DataFrame(data['Data']['Data'])
    df['Timestamp'] = pd.to_datetime(df['time'], unit='s')
    df['Fsym'] = fsym
    df['Tsym'] = tsym
    df = df[['Timestamp', 'Fsym', 'Tsym', 'open', 'high', 'low', 'close', 'volumefrom', 'volumeto']]
    df.rename(columns={'open': 'Open', 'high': 'High', 'low': 'Low', 'close': 'Close', 'volumefrom': 'VolumeFrom', 'volumeto': 'VolumeTo'}, inplace=True)
    return df

# --- 4. Collecte et Pré-traitement de toutes les données ---

if __name__ == "__main__":
    # --- Charger le dictionnaire CRYPTOS depuis le fichier JSON externe ---
    print(f"Chargement du dictionnaire CRYPTOS depuis '{COINGECKO_TOP_CRYPTOS_FILE}'...")
    CRYPTOS = build_cryptos_from_coingecko_json(COINGECKO_TOP_CRYPTOS_FILE, top_n=100) # Limite à 100 pour être sûr

    if not CRYPTOS:
        print("Aucune cryptomonnaie n'a pu être chargée. Le script va s'arrêter.")
        exit() # Arrête le script si CRYPTOS est vide

    print(f"Dictionnaire CRYPTOS chargé avec {len(CRYPTOS)} cryptomonnaies.")
    # print("Cryptomonnaies chargées:", list(CRYPTOS.keys())) # Décommenter pour voir la liste

    # Dictionnaire temporaire pour stocker toutes les données collectées
    # avant de les diviser en fichiers individuels
    all_collected_data_temp = {
        "metadata": {
            "collection_timestamp": datetime.now().isoformat(),
            "data_range_approximation": f"Binance/CryptoCompare: {START_DATE_3_YEARS_AGO.strftime('%Y-%m-%d')} to {END_DATE.strftime('%Y-%m-%d')}, CoinGecko: Last 365 days",
            "cryptos_collected": list(CRYPTOS.keys())
        },
        "coingecko_current_prices_raw": {}, # Pour stocker les prix actuels CoinGecko tels quels
        "binance_historical_daily": {},
        "coingecko_historical": {},
        "cryptocompare_historical_daily": {}
    }

    print("--- Début de la collecte des données historiques pour l'entraînement du modèle ---")

    # Collecte des prix actuels CoinGecko (en batch, pour être efficace)
    print("\nCollecte des prix actuels CoinGecko (en batch)...")
    current_coin_ids = [info['coingecko_id'] for info in CRYPTOS.values()]
    current_vs_currencies = VS_CURRENCIES.split(',')
    coingecko_current_prices_raw = get_coingecko_current_price(current_coin_ids, current_vs_currencies)
    if coingecko_current_prices_raw:
        all_collected_data_temp["coingecko_current_prices_raw"] = coingecko_current_prices_raw
        print(f"    Collecté prix actuels pour {len(current_coin_ids)} cryptos.")
    time.sleep(1)

    for crypto_key, info in CRYPTOS.items():
        print(f"\nCollecte pour {crypto_key} ({info['coingecko_id']})...")

        # Binance Daily OHLCV
        # Vérifiez que le symbole Binance n'est pas "USDTUSDT" ou similaire pour éviter les erreurs
        if info['binance_symbol'] not in ["USDTUSDT", "USDUSDT"]: # Ajout de USDUSDT au cas où
            print(f"  - Binance Daily OHLCV ({info['binance_symbol']})...")
            binance_klines = get_binance_klines(info['binance_symbol'], "1d", START_DATE_3_YEARS_AGO.strftime("%Y-%m-%d"), END_DATE.strftime("%Y-%m-%d"))
            if binance_klines:
                df_binance_hist = process_binance_klines(binance_klines, info['binance_symbol'])
                df_binance_hist['Timestamp'] = df_binance_hist['Timestamp'].apply(lambda x: x.isoformat())
                all_collected_data_temp["binance_historical_daily"][crypto_key] = df_binance_hist.to_dict(orient='records')
                print(f"    Collecté {len(df_binance_hist)} bougies journalières Binance.")
            else:
                print(f"    Pas de données Binance pour {info['binance_symbol']}.")
            time.sleep(1) # Pause entre les cryptos pour Binance
        else:
            print(f"  - Ignoré Binance Daily OHLCV pour {crypto_key} car le symbole est un stablecoin.")


        # CoinGecko Historical Market Chart (limité à 365 jours pour le tier gratuit)
        print(f"  - CoinGecko Market Chart ({info['coingecko_id']})...")
        coingecko_market_data_raw = get_coingecko_market_chart(info['coingecko_id'], VS_CURRENCIES.split(','), days="365")
        if coingecko_market_data_raw:
            processed_coingecko_data = process_coingecko_market_chart(coingecko_market_data_raw, info['coingecko_id'], VS_CURRENCIES.split(','))
            
            for currency_key in processed_coingecko_data:
                for item in processed_coingecko_data[currency_key]:
                    if 'Timestamp' in item and isinstance(item['Timestamp'], datetime):
                        item['Timestamp'] = item['Timestamp'].isoformat()
            
            all_collected_data_temp["coingecko_historical"][crypto_key] = processed_coingecko_data
            print(f"    Collecté données historiques CoinGecko pour {info['coingecko_id']} (365 jours) en {', '.join(VS_CURRENCIES.split(','))}.")
        else:
            print(f"    Pas de données CoinGecko pour {info['coingecko_id']}.")
        time.sleep(2) # CoinGecko a une limite de 50 appels/min sur le tier gratuit


        # CryptoCompare Historical Daily (limite de 2000 jours couvre plusieurs années)
        print(f"  - CryptoCompare Daily ({info['cryptocompare_fsym']}/{info['cryptocompare_tsym']})...")
        # Vérifiez que fsym et tsym ne sont pas les mêmes, ce qui arrive avec USDTUSDT
        if info['cryptocompare_fsym'] != info['cryptocompare_tsym']:
            cryptocompare_hist_data = get_cryptocompare_histoday(info['cryptocompare_fsym'], info['cryptocompare_tsym'], limit=2000)
            if cryptocompare_hist_data and cryptocompare_hist_data.get('Data', {}).get('Data'):
                df_cryptocompare_hist = process_cryptocompare_histoday(cryptocompare_hist_data, info['cryptocompare_fsym'], info['cryptocompare_tsym'])
                if not df_cryptocompare_hist.empty:
                    df_cryptocompare_hist['Timestamp'] = df_cryptocompare_hist['Timestamp'].apply(lambda x: x.isoformat())
                    all_collected_data_temp["cryptocompare_historical_daily"][crypto_key] = df_cryptocompare_hist.to_dict(orient='records')
                    print(f"    Collecté {len(df_cryptocompare_hist)} bougies journalières CryptoCompare.")
                else:
                    print(f"    DataFrame CryptoCompare vide pour {info['cryptocompare_fsym']}.")
            else:
                print(f"    Pas de données CryptoCompare pour {info['cryptocompare_fsym']}/{info['cryptocompare_tsym']}.")
            time.sleep(1) # Pause entre les cryptos pour CryptoCompare
        else:
            print(f"  - Ignoré CryptoCompare Daily pour {crypto_key} car fsym et tsym sont identiques (stablecoin).")

    # --- 5. Sauvegarde des données dans des fichiers JSON individuels dans des répertoires dédiés ---
    print(f"\n--- Sauvegarde des données dans des fichiers individuels, chaque crypto dans son répertoire dédié sous '{ROOT_OUTPUT_DIR}' ---")
    os.makedirs(ROOT_OUTPUT_DIR, exist_ok=True) # Crée le répertoire racine s'il n'existe pas

    for crypto_key, info in CRYPTOS.items():
        # Créer le répertoire spécifique à la cryptomonnaie
        crypto_specific_dir = os.path.join(ROOT_OUTPUT_DIR, crypto_key)
        os.makedirs(crypto_specific_dir, exist_ok=True)

        single_crypto_output = {
            "metadata": {
                "crypto_key": crypto_key,
                "coingecko_id": info['coingecko_id'],
                "binance_symbol": info['binance_symbol'],
                "cryptocompare_fsym": info['cryptocompare_fsym'],
                "cryptocompare_tsym": info['cryptocompare_tsym'],
                "collection_timestamp": all_collected_data_temp["metadata"]["collection_timestamp"],
                "data_range_approximation": all_collected_data_temp["metadata"]["data_range_approximation"]
            },
            "current_prices": {},
            "binance_historical_daily": all_collected_data_temp["binance_historical_daily"].get(crypto_key, []),
            "coingecko_historical": all_collected_data_temp["coingecko_historical"].get(crypto_key, {}),
            "cryptocompare_historical_daily": all_collected_data_temp["cryptocompare_historical_daily"].get(crypto_key, [])
        }

        # Ajouter les prix actuels de CoinGecko si disponibles
        coingecko_id = info['coingecko_id']
        if coingecko_id in all_collected_data_temp["coingecko_current_prices_raw"]:
            single_crypto_output["current_prices"]["coingecko"] = all_collected_data_temp["coingecko_current_prices_raw"][coingecko_id]
        
        output_filepath = os.path.join(crypto_specific_dir, f"{crypto_key}.json")
        try:
            with open(output_filepath, 'w', encoding='utf-8') as f:
                json.dump(single_crypto_output, f, indent=4, ensure_ascii=False)
            print(f"  Enregistré les données pour {crypto_key} dans '{output_filepath}'")
        except Exception as e:
            print(f"  Erreur lors de l'enregistrement des données pour {crypto_key}: {e}")
    
    print(f"\n--- Collecte et sauvegarde terminées. Les fichiers JSON individuels sont organisés par crypto dans le répertoire '{ROOT_OUTPUT_DIR}' ---")
    print("Ces fichiers contiennent les données historiques de chaque cryptomonnaie pour l'entraînement de votre modèle.")
