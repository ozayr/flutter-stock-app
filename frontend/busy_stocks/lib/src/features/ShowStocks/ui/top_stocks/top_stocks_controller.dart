import 'package:busy_stocks/src/features/ShowStocks/models/stock_data.dart';
import 'package:busy_stocks/src/features/ShowStocks/repository/yfinance_repository.dart';
import 'package:busy_stocks/src/features/ShowStocks/services/refresh_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topStockControllerProvider = StateNotifierProvider.family<
    TopStockController, AsyncValue<StockData>, String>((ref, symbol) {
  ref.watch(appRefreshProvider);
  return TopStockController(
      yfinance: ref.read(yahooFinanceRepositoryProvider), symbol: symbol);
});

class TopStockController extends StateNotifier<AsyncValue<StockData>> {
  TopStockController({required this.yfinance, required this.symbol})
      : super(const AsyncLoading()) {
    loadData();
  }

  YahooFinanceRepository yfinance;
  String symbol;

  Future<void> loadData() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    state = await AsyncValue.guard(() => yfinance.getStockData(symbol));
  }
}
