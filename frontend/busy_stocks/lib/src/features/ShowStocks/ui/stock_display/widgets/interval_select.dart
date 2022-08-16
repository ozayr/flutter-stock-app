
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/widgets/chip_select.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/stock_display_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntervalSelect extends ConsumerWidget {
  const IntervalSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period = ref.watch(stockDisplayPeriodProvider);
    final grainFilter = ref.watch(grainFilterProvider);
    final interval = ref.watch(stockDisplayIntervalProvider);
    return ChipSelect(
      onChanged: (intervalChoice) => ref
          .read(stockDisplayIntervalProvider.state)
          .update((state) => intervalChoice),
      source: grainFilter[period]!,
      value: interval,
    );
  }
}