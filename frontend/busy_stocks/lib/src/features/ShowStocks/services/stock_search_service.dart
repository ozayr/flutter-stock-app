import 'package:busy_stocks/src/features/ShowStocks/models/stock_data.dart';
import 'package:busy_stocks/src/features/ShowStocks/repository/yfinance_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeStockProvider = StateProvider<StockData?>((ref) {
  return null;
});

final searchServiceProvider = Provider<SearchService>((ref) {
  return SearchService(ref.read);
});

class SearchService {
  SearchService(this.read);

  Reader read;

  Future<void> getStockData(String symbol) async {
    final data =
        await read(yahooFinanceRepositoryProvider).getStockData(symbol);
    read(activeStockProvider.state).update((state) => data);
  }
}
