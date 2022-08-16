import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_controller.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_card_display.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Watchlist extends ConsumerWidget {
  const Watchlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(watchlistRefresProvider);
    final watchlist = ref.watch(watchlistProvider);
    return watchlist!.isNotEmpty
        ? ListView.builder(
            itemCount: watchlist.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: WatchlistCardDisplay(
                  symbol: watchlist[index],
                ),
              );
            })
        : Center(
            child: Text(
              'Watchlist Empty',
              style: kSmallHeaderText,
            ),
          );
  }
}
