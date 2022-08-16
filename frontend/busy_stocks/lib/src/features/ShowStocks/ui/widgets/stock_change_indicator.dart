import 'package:busy_stocks/src/features/ShowStocks/models/stock_data.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';

class StockChangeIndicator extends StatelessWidget {
  const StockChangeIndicator({
    Key? key,
    required this.stock,
  }) : super(key: key);

  final StockData stock;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text:
                '(${stock.gain ? '+' : '-'}${stock.priceChange.toStringAsFixed(2)})',
            style: kSmallSubText.copyWith(
                color: stock.gain ? Colors.green : Colors.red),
            children: [
          WidgetSpan(
              baseline: TextBaseline.ideographic,
              child: stock.gain
                  ? const Icon(
                      Icons.arrow_drop_up,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.red,
                    )),
          TextSpan(text: '${stock.percentageChange.toStringAsFixed(2)}%')
        ]));
  }
}
