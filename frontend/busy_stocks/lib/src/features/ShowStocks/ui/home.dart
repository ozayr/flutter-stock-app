import 'package:busy_stocks/src/features/ShowStocks/ui/stock_search/stock_search.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/top_stocks/top_stocks.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/watchlist_section.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/widgets/home_header.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0c1325),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              StockSearch(),
              Expanded(flex: 3, child: TopStocks()),
              Expanded(
                flex: 2,
                child: WatchListSection(),
              )
            ]),
      ),
    );
  }
}
