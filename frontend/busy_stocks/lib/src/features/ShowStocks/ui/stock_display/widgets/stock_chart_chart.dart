import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/widgets/chart_loading_skeleton.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/stock_display_controller.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Chart extends ConsumerWidget {
  const Chart({
    Key? key,
    required this.symbol
  }) : super(key: key);

  final String symbol;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getStockdata = ref.watch(stockChartDataProvider(symbol));
    return getStockdata.when(
        data: (data) => Sparkline(
              data: data.data,
              enableGridLines: true,
              gridLineColor: Colors.white,
              fillMode: FillMode.below,
              lineWidth: 2.0,
              fillGradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    kBackgroundColor,
                    kSecondaryColor.withOpacity(0.7),
                    kPrimaryColor.withOpacity(0.9)
                  ]),
              lineGradient:
                  LinearGradient(colors: [kSecondaryColor, kPrimaryColor]),
            ),
        error: (err, st) => const Text('err'),
        loading: () => const ChartLoadingSkeleton());
  }
}
