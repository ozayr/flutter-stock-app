import 'package:busy_stocks/src/features/ShowStocks/services/stock_search_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockSearchControllerProvider = StateNotifierProvider.autoDispose<
    StockSearchController, AsyncValue<void>>((ref) {
  return StockSearchController(ref.read(searchServiceProvider));
});

class StockSearchController extends StateNotifier<AsyncValue<void>> {
  StockSearchController(this.searchService)
      : super(const AsyncData<void>(null));
  SearchService searchService;

  Future<void> searchSymbol(
      {required String symbol, required VoidCallback onSucess}) async {
    state = const AsyncLoading();
    final newState = await AsyncValue.guard<void>(
        () async => await searchService.getStockData(symbol));
    if (mounted) {
      state = newState;
      if (state.hasError == false) {
        onSucess();
      }
    }
  }
}
