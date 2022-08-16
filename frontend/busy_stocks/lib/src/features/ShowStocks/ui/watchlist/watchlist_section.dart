import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_header.dart';
import 'package:flutter/material.dart';

class WatchListSection extends StatelessWidget {
  const WatchListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        WatchlistHeader(),
        SizedBox(height: 200, child: Watchlist()),
      ],
    );
  }
}
