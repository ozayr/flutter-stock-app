import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChartLoadingSkeleton extends StatelessWidget {
  const ChartLoadingSkeleton({
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
            lineWidth: 2.0,
            lineColor: Colors.grey,
          ),
        );
  }
}