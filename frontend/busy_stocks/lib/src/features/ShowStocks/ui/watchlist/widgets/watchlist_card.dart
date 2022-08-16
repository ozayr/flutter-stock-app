import 'package:busy_stocks/src/features/ShowStocks/models/stock_data.dart';
import 'package:busy_stocks/src/features/ShowStocks/services/stock_search_service.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/stock_display.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_card_chart.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_logo.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/widgets/frosted_card.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/widgets/stock_change_indicator.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/widgets/stock_price_indicator.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatchListCard extends ConsumerWidget {
  const WatchListCard({
    required this.stock,
    Key? key,
  }) : super(key: key);

  final StockData stock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 250,
      child: GestureDetector(
        onTap: () {
          ref.read(activeStockProvider.state).update((state) => stock);
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const StockDisplay(),
            ),
          );
        },
        child: FrostedCard(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WatchlistLogo(
                      logoUrl: stock.logoUrl,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          stock.symbol,
                          style: kSmallHeaderText,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          stock.companyName,
                          style: kSmallSubText,
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 90,
                        height: 50,
                        child: WatchlistCardChart(
                          symbol: stock.symbol,
                          gain: stock.gain,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        StockPriceIndicator(
                          stock: stock,
                          scale: 1.2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        StockChangeIndicator(stock: stock)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
