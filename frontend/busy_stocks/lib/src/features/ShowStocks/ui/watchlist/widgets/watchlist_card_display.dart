import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_card.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_card_display_controller.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/watchlist/widgets/watchlist_loading_card_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatchlistCardDisplay extends ConsumerWidget {
  const WatchlistCardDisplay({super.key, required this.symbol});

  final String symbol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stock = ref.watch(watchlistStockDataProvider(symbol));
    return stock.isLoading
        ? const WatchListLoadingCardSkeleton()
        : WatchListCard(stock: stock.value!);
  }
}
