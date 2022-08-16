

from src import *
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI()

class StockData(BaseModel):
    open: float
    currentPrice: float
    name: str
    symbol: str
    logoUrl: str


# ENDPOINTS 
@app.get("/stock/{symbol}",response_model=StockData)
def stockData(symbol: str):  
    try:
        return getStockData(symbol=symbol)
    except:
        raise HTTPException(status_code=404, detail="Symbol Not Found")

@app.get('/history/{symbol}/{period}/{interval}')
def stockHistory(symbol: str,period:str, interval:str):
    return getStockHistory(symbol,period,interval)







