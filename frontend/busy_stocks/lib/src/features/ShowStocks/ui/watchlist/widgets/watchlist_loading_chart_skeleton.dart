import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WatchlistLoadingChartSkeleton extends StatelessWidget {
  const WatchlistLoadingChartSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.withOpacity(0.4),
      child: Sparkline(
        data: List.generate(5, (index) => Random().nextDouble()) +
            List.generate(5, (index) => Random().nextDouble() * 2),
        lineColor: Colors.white,
      ),
    );
  }
}