import 'package:busy_stocks/src/features/ShowStocks/models/stock_history.dart';
import 'package:busy_stocks/src/features/ShowStocks/repository/yfinance_repository.dart';
import 'package:busy_stocks/src/features/ShowStocks/services/refresh_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





final watchlistChartHistoryProvider = StateNotifierProvider.family<
    WatchlistChartHistoryController, AsyncValue<StockHistory>, String>((ref, symbol) {
  ref.watch(appRefreshProvider);
  return WatchlistChartHistoryController(
      yfinance: ref.read(yahooFinanceRepositoryProvider), symbol: symbol);
});

class WatchlistChartHistoryController extends StateNotifier<AsyncValue<StockHistory>> {
  WatchlistChartHistoryController({required this.yfinance, required this.symbol})
      : super(const AsyncLoading()) {
    loadData();
  }

  YahooFinanceRepository yfinance;
  String symbol;

  Future<void> loadData() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(milliseconds: 500)); // since data is cached just to show the user something happen
    state = await AsyncValue.guard(() => yfinance.getStockHistory(symbol.toLowerCase(),'1d','30m'));
  }
}