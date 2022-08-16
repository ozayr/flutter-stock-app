import 'package:busy_stocks/src/globals/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class TopStocksLoading extends StatelessWidget {
  const TopStocksLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(
        width: 50,
        height: 50,
        child: Skeleton(),
      ),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Skeleton(
              width: 80,
              height: 10,
            ),
            Skeleton(
              width: 40,
              height: 10,
            )
          ]),
      subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Skeleton(
              width: 160,
              height: 10,
            ),
            Skeleton(
              width: 60,
              height: 10,
            )
          ]),
    );
  }
}
