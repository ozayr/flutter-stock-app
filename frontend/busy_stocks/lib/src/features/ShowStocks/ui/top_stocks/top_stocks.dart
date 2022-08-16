import 'package:busy_stocks/src/features/ShowStocks/ui/top_stocks/widgets/header.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/top_stocks/widgets/top_stocks_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopStocks extends ConsumerWidget {
  const TopStocks({
    Key? key,
  }) : super(key: key);

  static const topStocks = ['goog', 'amzn', 'aapl', 'meta', 'nflx'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          Expanded(
            child: ListView.builder(
                itemCount: topStocks.length,
                itemBuilder: (context, index) {
                  return TopStocksListTile(symbol: topStocks[index]);
                }),
          )
        ],
      ),
    );
  }
}
