import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';

class ChipSelect extends StatelessWidget {
  const ChipSelect({
    Key? key,
    required this.onChanged,
    required this.source,
    required this.value,
  }) : super(key: key);

  final void Function(String) onChanged;
  final List<String> source;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ChipsChoice<String>.single(
      value: value,
      onChanged: onChanged,
      choiceItems: C2Choice.listFrom<String, String>(
        source: source,
        value: (i, v) => v,
        label: (i, v) => v,
      ),
      choiceStyle: C2ChoiceStyle(
        color: Colors.white,
        showCheckmark: false,
        borderRadius: const BorderRadius.all( Radius.circular(5)),
        borderColor: Colors.black.withOpacity(0.1),
        backgroundColor: kBackgroundColor.withOpacity(0.9),
      ),
      choiceActiveStyle: C2ChoiceStyle(
          showCheckmark: false,
          color: Colors.white,
          borderColor: kPrimaryColor,
          borderRadius: const BorderRadius.all( Radius.circular(5)),
          backgroundColor: kPrimaryColor),
    );
  }
}