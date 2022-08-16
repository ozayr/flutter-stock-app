import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRefreshProvider = StateProvider<bool>((ref) {
  return false;
});
