import requests
import pandas as pd
from abc import ABC, abstractmethod
from typing import List, Dict, Optional, Union
from datetime import datetime

class CryptoDataProvider(ABC):
    """
    Abstract base class for crypto data providers.
    """
    
    @abstractmethod
    def get_current_price(self, symbol: str, currency: str = "usd") -> Optional[float]:
        """
        Get the current price of a crypto asset.
        """
        pass

    @abstractmethod
    def get_historical_data(self, symbol: str, currency: str = "usd", interval: str = "1h", limit: int = 24) -> pd.DataFrame:
        """
        Get historical OHLCV data.
        """
        pass

    @abstractmethod
    def get_top_symbols(self, limit: int = 10) -> List[str]:
        """
        Get top N symbols by market cap or volume.
        """
        pass

class BinanceProvider(CryptoDataProvider):
    BASE_URL = "https://api.binance.com/api/v3"

    def get_current_price(self, symbol: str, currency: str = "USDT") -> Optional[float]:
        # Binance symbols are usually pairs like BTCUSDT
        pair = f"{symbol.upper()}{currency.upper()}"
        endpoint = f"{self.BASE_URL}/ticker/price"
        params = {"symbol": pair}
        try:
            response = requests.get(endpoint, params=params)
            response.raise_for_status()
            data = response.json()
            return float(data['price'])
        except requests.exceptions.RequestException as e:
            print(f"Binance Error (Price): {e}")
            return None

    def get_historical_data(self, symbol: str, currency: str = "USDT", interval: str = "1h", limit: int = 24) -> pd.DataFrame:
        pair = f"{symbol.upper()}{currency.upper()}"
        endpoint = f"{self.BASE_URL}/klines"
        params = {
            "symbol": pair,
            "interval": interval,
            "limit": limit
        }
        try:
            response = requests.get(endpoint, params=params)
            response.raise_for_status()
            data = response.json()
            
            if not data:
                return pd.DataFrame()

            df = pd.DataFrame(data, columns=[
                'Open time', 'Open', 'High', 'Low', 'Close', 'Volume',
                'Close time', 'Quote asset volume', 'Number of trades',
                'Taker buy base asset volume', 'Taker buy quote asset volume', 'Ignore'
            ])
            
            df['Open time'] = pd.to_datetime(df['Open time'], unit='ms')
            df['Close time'] = pd.to_datetime(df['Close time'], unit='ms')
            
            numeric_cols = ['Open', 'High', 'Low', 'Close', 'Volume']
            for col in numeric_cols:
                df[col] = pd.to_numeric(df[col], errors='coerce')
                
            df['Symbol'] = pair
            return df[['Open time', 'Symbol', 'Open', 'High', 'Low', 'Close', 'Volume']]

        except requests.exceptions.RequestException as e:
            print(f"Binance Error (History): {e}")
            return pd.DataFrame()

    def get_top_symbols(self, limit: int = 10) -> List[str]:
        # Get 24hr ticker price change statistics
        endpoint = f"{self.BASE_URL}/ticker/24hr"
        try:
            response = requests.get(endpoint)
            response.raise_for_status()
            data = response.json()
            
            # Filter for USDT pairs to be consistent
            usdt_pairs = [item for item in data if item['symbol'].endswith('USDT')]
            
            # Sort by quote volume (market activity)
            sorted_pairs = sorted(usdt_pairs, key=lambda x: float(x['quoteVolume']), reverse=True)
            
            return [item['symbol'] for item in sorted_pairs[:limit]]
        except requests.exceptions.RequestException as e:
            print(f"Binance Error (Top Symbols): {e}")
            return []

class CoinGeckoProvider(CryptoDataProvider):
    BASE_URL = "https://api.coingecko.com/api/v3"

    def get_current_price(self, symbol: str, currency: str = "usd") -> Optional[float]:
        # CoinGecko uses IDs (e.g., 'bitcoin') not symbols ('BTC') usually. 
        # For simplicity, we assume the user passes the ID here or we'd need a mapping.
        # Let's assume 'symbol' is the CoinGecko ID for now.
        endpoint = f"{self.BASE_URL}/simple/price"
        params = {
            "ids": symbol.lower(),
            "vs_currencies": currency.lower()
        }
        try:
            response = requests.get(endpoint, params=params)
            response.raise_for_status()
            data = response.json()
            if symbol.lower() in data and currency.lower() in data[symbol.lower()]:
                return float(data[symbol.lower()][currency.lower()])
            return None
        except requests.exceptions.RequestException as e:
            print(f"CoinGecko Error (Price): {e}")
            return None

    def get_historical_data(self, symbol: str, currency: str = "usd", interval: str = "1h", limit: int = 24) -> pd.DataFrame:
        # CoinGecko free API has limitations on historical data granularity.
        # /coins/{id}/market_chart is the closest endpoint.
        endpoint = f"{self.BASE_URL}/coins/{symbol.lower()}/market_chart"
        # days=1 gives roughly hourly data (every 5 mins actually, need to resample if strict)
        days = 1 if limit <= 24 else limit // 24 + 1 
        params = {
            "vs_currency": currency.lower(),
            "days": str(days)
        }
        try:
            response = requests.get(endpoint, params=params)
            response.raise_for_status()
            data = response.json()
            
            prices = data.get('prices', [])
            if not prices:
                return pd.DataFrame()

            df = pd.DataFrame(prices, columns=['Timestamp', 'Price'])
            df['Timestamp'] = pd.to_datetime(df['Timestamp'], unit='ms')
            df['Symbol'] = symbol
            
            # CoinGecko market_chart doesn't give OHLC for free easily in this endpoint, mostly prices.
            # But /coins/{id}/ohlc exists for 1/7/14/30/90/180/365/max days
            # Let's try OHLC endpoint if interval matches supported ones.
            # For this implementation, let's stick to market_chart as it's more flexible for "recent" data, 
            # but note it's just price points. 
            # If we strictly need OHLC, we should use the OHLC endpoint.
            
            return df

        except requests.exceptions.RequestException as e:
            print(f"CoinGecko Error (History): {e}")
            return pd.DataFrame()

    def get_top_symbols(self, limit: int = 10) -> List[str]:
        endpoint = f"{self.BASE_URL}/coins/markets"
        params = {
            "vs_currency": "usd",
            "order": "market_cap_desc",
            "per_page": limit,
            "page": 1
        }
        try:
            response = requests.get(endpoint, params=params)
            response.raise_for_status()
            data = response.json()
            return [item['id'] for item in data]
        except requests.exceptions.RequestException as e:
            print(f"CoinGecko Error (Top Symbols): {e}")
            return []

class CryptoCompareProvider(CryptoDataProvider):
    BASE_URL = "https://min-api.cryptocompare.com/data"

    def get_current_price(self, symbol: str, currency: str = "USD") -> Optional[float]:
        endpoint = f"{self.BASE_URL}/price"
        params = {
            "fsym": symbol.upper(),
            "tsyms": currency.upper()
        }
        try:
            response = requests.get(endpoint, params=params)
            response.raise_for_status()
            data = response.json()
            return float(data.get(currency.upper(), 0.0))
        except requests.exceptions.RequestException as e:
            print(f"CryptoCompare Error (Price): {e}")
            return None

    def get_historical_data(self, symbol: str, currency: str = "USD", interval: str = "1h", limit: int = 24) -> pd.DataFrame:
        endpoint = f"{self.BASE_URL}/v2/histohour"
        params = {
            "fsym": symbol.upper(),
            "tsym": currency.upper(),
            "limit": limit
        }
        try:
            response = requests.get(endpoint, params=params)
            response.raise_for_status()
            data = response.json()
            
            ohlcv_data = data.get('Data', {}).get('Data', [])
            if not ohlcv_data:
                return pd.DataFrame()

            df = pd.DataFrame(ohlcv_data)
            df['time'] = pd.to_datetime(df['time'], unit='s')
            df = df.rename(columns={'time': 'Timestamp', 'open': 'Open', 'high': 'High',
                                    'low': 'Low', 'close': 'Close', 'volumefrom': 'VolumeFrom',
                                    'volumeto': 'VolumeTo'})
            
            numeric_cols = ['Open', 'High', 'Low', 'Close', 'VolumeFrom', 'VolumeTo']
            for col in numeric_cols:
                df[col] = pd.to_numeric(df[col], errors='coerce')

            df['Symbol'] = f"{symbol}/{currency}"
            return df[['Timestamp', 'Symbol', 'Open', 'High', 'Low', 'Close', 'VolumeFrom', 'VolumeTo']]

        except requests.exceptions.RequestException as e:
            print(f"CryptoCompare Error (History): {e}")
            return pd.DataFrame()

    def get_top_symbols(self, limit: int = 10) -> List[str]:
        endpoint = f"https://min-api.cryptocompare.com/data/top/mktcapfull"
        params = {
            "limit": limit,
            "tsym": "USD"
        }
        try:
            response = requests.get(endpoint, params=params)
            response.raise_for_status()
            data = response.json()
            return [item['CoinInfo']['Name'] for item in data.get('Data', [])]
        except requests.exceptions.RequestException as e:
            print(f"CryptoCompare Error (Top Symbols): {e}")
            return []

class DataCollector:
    def __init__(self):
        self.providers: Dict[str, CryptoDataProvider] = {
            'binance': BinanceProvider(),
            'coingecko': CoinGeckoProvider(),
            'cryptocompare': CryptoCompareProvider()
        }

    def get_price_from_all(self, symbol: str, currency: str = "usd") -> Dict[str, Optional[float]]:
        results = {}
        for name, provider in self.providers.items():
            # Note: Symbols might need mapping per provider in a real app
            # Here we assume the user passes a generic symbol like 'bitcoin' for CoinGecko 
            # and we might need to handle it. 
            # For simplicity in this demo, we'll pass the symbol as is.
            # In a real scenario, we'd have a symbol mapper.
            results[name] = provider.get_current_price(symbol, currency)
        return results

    def get_history_from_provider(self, provider_name: str, symbol: str, currency: str = "usd", limit: int = 24) -> pd.DataFrame:
        if provider_name not in self.providers:
            print(f"Provider {provider_name} not found.")
            return pd.DataFrame()
        return self.providers[provider_name].get_historical_data(symbol, currency, limit=limit)

    def get_top_symbols_from_provider(self, provider_name: str, limit: int = 10) -> List[str]:
        if provider_name not in self.providers:
            print(f"Provider {provider_name} not found.")
            return []
        return self.providers[provider_name].get_top_symbols(limit)

