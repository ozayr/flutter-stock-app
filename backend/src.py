from typing import List
from timed_lru_cache import timed_lru_cache
import yfinance as yf

@timed_lru_cache(seconds=30)
def getStockData(symbol: str)->dict:
    ticker = yf.Ticker(symbol).get_info()
    return {'open':ticker['open'],'currentPrice':ticker['currentPrice'],'name':ticker['shortName'],'symbol':ticker['symbol'],'logoUrl':ticker['logo_url']}



@timed_lru_cache(seconds=30)
def getStockHistory(symbol:str , period: str, interval:str)->List[float]:
    data = yf.Ticker(symbol).history(period=period,interval=interval)
    data = data.dropna()
    return data.Close.values.tolist() 