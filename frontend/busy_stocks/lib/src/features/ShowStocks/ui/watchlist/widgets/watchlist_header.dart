import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';

class WatchlistHeader extends StatelessWidget {
  const WatchlistHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Watchlist',
        style: kSmallHeaderText,
      ),
    );
  }
}