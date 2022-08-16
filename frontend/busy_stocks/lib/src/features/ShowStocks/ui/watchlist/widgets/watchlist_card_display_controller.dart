import 'package:busy_stocks/src/features/ShowStocks/models/stock_data.dart';
import 'package:busy_stocks/src/features/ShowStocks/repository/yfinance_repository.dart';
import 'package:busy_stocks/src/features/ShowStocks/services/refresh_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final watchlistStockDataProvider = StateNotifierProvider.family<
    WatchlistCardDisplayController, AsyncValue<StockData>, String>((ref, symbol) {
  ref.watch(appRefreshProvider);
  return WatchlistCardDisplayController(
      yfinance: ref.read(yahooFinanceRepositoryProvider), symbol: symbol);
});

class WatchlistCardDisplayController extends StateNotifier<AsyncValue<StockData>> {
  WatchlistCardDisplayController({required this.yfinance, required this.symbol})
      : super(const AsyncLoading()) {
    loadData();
  }

  YahooFinanceRepository yfinance;
  String symbol;

  Future<void> loadData() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(milliseconds: 500)); // since data is cached just to show the user something happen
    state = await AsyncValue.guard(() => yfinance.getStockData(symbol.toLowerCase()));
  }
}