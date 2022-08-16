import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/widgets/interval_select.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/widgets/period_select.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/widgets/stock_chart_chart.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';

class StockDisplayChart extends StatelessWidget {
  const StockDisplayChart({
    Key? key,
    required this.symbol
  }) : super(key: key);

  final String symbol;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Period',
              style: kDefaultTextStyle,
            ),
          ),
        ),
        const PeriodSelect(),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Interval',
              style: kDefaultTextStyle,
            ),
          ),
        ),
        const IntervalSelect(),
         Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chart(symbol: symbol,),
          ),
        )
      ],
    );
  }
}
