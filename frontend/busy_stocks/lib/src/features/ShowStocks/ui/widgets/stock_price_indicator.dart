import 'package:busy_stocks/src/features/ShowStocks/models/stock_data.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';

class StockPriceIndicator extends StatelessWidget {
  const StockPriceIndicator({Key? key, required this.stock, this.scale = 1})
      : super(key: key);

  final StockData stock;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: stock.currentPrice.toStringAsFixed(2),
          style: kSmallHeaderText.copyWith(
              fontSize: kSmallHeaderText.fontSize! * scale),
          children: [
            TextSpan(
                text: ' USD',
                style: kSmallSubText.copyWith(
                    fontSize: kSmallSubText.fontSize! * scale))
          ]),
    );
  }
}
