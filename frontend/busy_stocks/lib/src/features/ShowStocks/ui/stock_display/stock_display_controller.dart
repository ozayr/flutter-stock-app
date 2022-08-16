import 'package:busy_stocks/src/features/ShowStocks/models/stock_history.dart';
import 'package:busy_stocks/src/features/ShowStocks/repository/local_storage.dart';
import 'package:busy_stocks/src/features/ShowStocks/services/stock_search_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:busy_stocks/src/features/ShowStocks/repository/yfinance_repository.dart';

final stockChartDataProvider = FutureProvider.family
    .autoDispose<StockHistory, String>((ref, symbol) async {
  final yfinance = ref.read(yahooFinanceRepositoryProvider);
  final period = ref.watch(stockDisplayPeriodProvider);
  final interval = ref.watch(stockDisplayIntervalProvider);
  return yfinance.getStockHistory(symbol.toLowerCase(), period, interval);
});

final stockDisplayIntervalProvider = StateProvider.autoDispose<String>((ref) {
  final period = ref.watch(stockDisplayPeriodProvider);
  final grainFilter = ref.watch(grainFilterProvider);
  return grainFilter[period]![0];
});

final stockDisplayPeriodProvider = StateProvider.autoDispose<String>((ref) {
  return '1d';
});

final grainFilterProvider =
    Provider.autoDispose<Map<String, List<String>>>((ref) {
  final Map<String, List<String>> grainFilter = {
    '1d': ['1m', '2m', '5m', '15m', '30m', '1h'],
    '1mo': ['5m', '15m', '30m', '1h', '1d', '1wk'],
    '6mo': ['1h', '1d', '5d', '1wk'],
    'ytd': ['1h', '1d', '5d', '1wk'],
    '1y': ['1h', '1d', '5d', '1wk', '1mo'],
    '5y': ['1d', '5d', '1wk', '1mo']
  };

  return grainFilter;
});

final isFavoriteProvider = StateProvider.autoDispose<bool>((ref) {
  final storage = ref.read(hiveStorageRepositoryProvider);
  final symbol = ref.read(activeStockProvider)!.symbol;
  return storage.isInWatchlist(symbol);
});


final watchlistManagerProvider = Provider.autoDispose<void>((ref) {
  final isFavorited = ref.watch(isFavoriteProvider);
  final symbol = ref.read(activeStockProvider)!.symbol;
  if (isFavorited) {
    ref.read(hiveStorageRepositoryProvider).addToWatchlist(symbol); 
  } else {
    ref.read(hiveStorageRepositoryProvider).removeFromWatchlist(symbol); 
  }
});
