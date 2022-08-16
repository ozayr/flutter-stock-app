import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_card_chart_controller.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_loading_chart_skeleton.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatchlistCardChart extends ConsumerWidget {
  const WatchlistCardChart({
    required this.symbol,
    required this.gain,
    super.key,
  });

  final String symbol;
  final bool gain;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartData = ref.watch(watchlistChartHistoryProvider(symbol));
    final Color lineColor = gain ? Colors.green : Colors.red;
    return chartData.isLoading
        ? const WatchlistLoadingChartSkeleton()
        : Sparkline(
            data: chartData.value!.data,
            lineColor: lineColor,
            fillMode: FillMode.below,
            fillGradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  lineColor.withOpacity(0.5),
                  lineColor.withOpacity(0.5)
                ]),
          );
  }
}
