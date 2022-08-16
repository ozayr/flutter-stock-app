import 'dart:math';

import 'package:busy_stocks/src/globals/widgets/skeleton.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WatchListLoadingCardSkeleton extends StatelessWidget {
  const WatchListLoadingCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Skeleton(
                      width: 50,
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Skeleton(
                          width: 40,
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Skeleton(
                          width: 80,
                          height: 10,
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.withOpacity(0.4),
                        child: Sparkline(
                          data: List.generate(
                                  5, (index) => Random().nextDouble()) +
                              List.generate(
                                  5, (index) => Random().nextDouble() * 2),
                          lineColor: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Skeleton(
                          width: 80,
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Skeleton(
                          width: 20,
                          height: 10,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
