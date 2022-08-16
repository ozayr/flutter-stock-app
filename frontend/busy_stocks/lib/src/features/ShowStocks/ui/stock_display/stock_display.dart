import 'package:busy_stocks/src/features/ShowStocks/services/stock_search_service.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/stock_display_controller.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/widgets/stock_display_chart.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/widgets/stock_display_header.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_search/stock_search_controller.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockDisplay extends ConsumerWidget {
  const StockDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //allows cancelation of stock search call when this screen is navigated to by other means
    ref.invalidate(stockSearchControllerProvider);

    final isFavorite = ref.watch(isFavoriteProvider);
    final stock = ref.watch(activeStockProvider);
    
    // called to initalize the watchlist manager used to add and remove the stock from the list
    ref.watch(watchlistManagerProvider);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(stock!.symbol),
        actions: [
          IconButton(
              onPressed: () =>
                  ref.read(isFavoriteProvider.state).update((state) => !state),
              icon: isFavorite
                  ? const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  : const Icon(Icons.star_border_outlined))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          StockDisplayHeader(
            stock: stock,
          ),
          Expanded(child: StockDisplayChart(symbol: stock.symbol))
        ],
      )),
    );
  }
}
