import 'package:busy_stocks/src/features/ShowStocks/repository/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchlistRefresProvider = Provider<void>((ref) {
  ref.read(hiveStorageRepositoryProvider).observeWatchlist().listen((event) {
    ref.refresh(watchlistProvider);
  });
});

final watchlistProvider = Provider<List<String>?>((ref) {
  return ref.read(hiveStorageRepositoryProvider).getWatchlist;
});
