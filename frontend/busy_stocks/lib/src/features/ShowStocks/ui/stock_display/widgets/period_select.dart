import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/widgets/chip_select.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/stock_display_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeriodSelect extends ConsumerWidget {
  const PeriodSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period = ref.watch(stockDisplayPeriodProvider);
    final grainFilter = ref.watch(grainFilterProvider);

    return ChipSelect(
      onChanged: (periodChoice) => ref
          .read(stockDisplayPeriodProvider.state)
          .update((state) => periodChoice),
      source: grainFilter.keys.toList(),
      value: period,
    );
  }
}
