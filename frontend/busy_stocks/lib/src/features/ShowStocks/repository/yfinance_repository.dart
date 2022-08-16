import 'dart:convert';

import 'package:busy_stocks/src/features/ShowStocks/models/stock_data.dart';
import 'package:busy_stocks/src/features/ShowStocks/models/stock_history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final yahooFinanceRepositoryProvider = Provider<YahooFinanceRepository>((ref) {
  return YahooFinanceRepository();
});

class YahooFinanceRepository {
  
  Future<StockData> getStockData(String symbol) async {
            http.Response data =
        await http.get(Uri.parse('http://127.0.0.1:8000/stock/$symbol'));
    Map<String, dynamic> responseBody = jsonDecode(data.body);

    if (data.statusCode == 404) {
      throw Exception(responseBody['detail']);
    }

    double priceChange = responseBody['open'] - responseBody['currentPrice'];
    double percentageChange = priceChange / responseBody['open'];

    StockData stockData = StockData(
      responseBody['currentPrice'] + 0.00,
      percentageChange.abs(),
      priceChange.abs(),
      priceChange > 0,
      responseBody['name'],
      responseBody['symbol'],
      responseBody['logoUrl'],
    );

    return stockData;
  }


  Future<StockHistory> getStockHistory(
      String symbol, String period, String interval) async {
    http.Response data = await http.get(
        Uri.parse('http://127.0.0.1:8000/history/$symbol/$period/$interval'));
    List<dynamic> responseBody = jsonDecode(data.body);
    return StockHistory(responseBody.map((e) => e as double).toList());
  }
}
