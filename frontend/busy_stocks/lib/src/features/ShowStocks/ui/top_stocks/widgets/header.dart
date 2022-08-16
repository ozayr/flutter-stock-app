import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Top Companies',
      style: kSmallHeaderText,
    );
  }
}