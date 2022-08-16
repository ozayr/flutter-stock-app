import 'package:flutter/material.dart';

class WatchlistLogo extends StatelessWidget {
  const WatchlistLogo({
    Key? key,
    required this.logoUrl,
  }) : super(key: key);

  final String logoUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Image.network(
        logoUrl,
      ),
    );
  }
}
