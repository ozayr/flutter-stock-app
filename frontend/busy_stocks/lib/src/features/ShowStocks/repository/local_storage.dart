import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final hiveStorageRepositoryProvider = Provider<HiveStorageRepository>((ref) {
  return HiveStorageRepository();
});

class HiveStorageRepository {
  final box = Hive.box<List<String>>('local');

  List<String>? get getWatchlist => box.get('watchlist', defaultValue: []);

  void addToWatchlist(String symbol) {
    List<String> watchlist = getWatchlist!;
    watchlist.add(symbol);
    box.put('watchlist', watchlist.toSet().toList());
  }

  void removeFromWatchlist(String symbol) {
    List<String> watchlist = getWatchlist!;
    watchlist.remove(symbol);
    box.put('watchlist', watchlist.toSet().toList());
  }

  bool isInWatchlist(String symbol) {
    List<String> watchlist = getWatchlist!;
    return watchlist.contains(symbol);
  }

  Stream<BoxEvent> observeWatchlist() {
    // returns watchlist on any event
    return box.watch(key: 'watchlist');
  }
}
