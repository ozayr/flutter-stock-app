import 'package:busy_stocks/src/features/ShowStocks/models/stock_data.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/widgets/stock_change_indicator.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/widgets/stock_price_indicator.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockDisplayHeader extends ConsumerWidget {
  const StockDisplayHeader({
    super.key,
    required this.stock
  });

  final StockData stock;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Image.network(
          stock.logoUrl,
        ),
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          stock.companyName,
          style: kSmallSubText,
        ),
        StockChangeIndicator(stock: stock),
      ]),
      subtitle: StockPriceIndicator(
        stock: stock,
        scale: 1.3,
      ),
    );
  }
}
