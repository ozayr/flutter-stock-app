import 'package:busy_stocks/src/features/ShowStocks/services/stock_search_service.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/stock_display.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/top_stocks/top_stocks_controller.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/top_stocks/widgets/top_stocks_loading_skeleton.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/widgets/stock_change_indicator.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/widgets/stock_price_indicator.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopStocksListTile extends ConsumerWidget {
  const TopStocksListTile({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  final String symbol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockState = ref.watch(topStockControllerProvider(symbol));
    return stockState.isLoading
        ? const TopStocksLoading()
        : ListTile(
            onTap: () {
              ref
                  .read(activeStockProvider.state)
                  .update((state) => stockState.value);
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const StockDisplay(),
                ),
              );
            },
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                stockState.value!.logoUrl,
              ),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    stockState.value!.symbol,
                    style: kSmallHeaderText,
                  ),
                  StockPriceIndicator(stock: stockState.value!)
                ]),
            subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    stockState.value!.companyName,
                    style: kSmallSubText,
                  ),
                  StockChangeIndicator(stock: stockState.value!),
                ]),
          );
  }
}
