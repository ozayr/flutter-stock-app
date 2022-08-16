import 'package:busy_stocks/src/features/ShowStocks/ui/stock_display/stock_display.dart';
import 'package:busy_stocks/src/features/ShowStocks/ui/stock_search/stock_search_controller.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:busy_stocks/src/globals/utils/async_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class StockSearch extends ConsumerWidget {
  const StockSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      stockSearchControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(stockSearchControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: kSecondaryColor,
        autocorrect: false,
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.text,
        onSubmitted: (String symbol) async {
          await ref.read(stockSearchControllerProvider.notifier).searchSymbol(
              symbol: symbol,
              // passing a call back to the controller allows us to seperate concerns by not having to pass the context to downstream layers
              onSucess: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const StockDisplay(),
                    ),
                  ));
        },
        style: kDefaultTextStyle,
        decoration: kTextFieldInputDecoration.copyWith(
            hintText: 'Search',
            suffixIcon: state.isLoading
                ? CircularProgressIndicator.adaptive(
                    backgroundColor: kSecondaryColor,
                  )
                : null,
            prefixIcon: Icon(
              Icons.search,
              color: kSecondaryColor.withOpacity(0.5),
            )),
      ),
    );
  }
}
