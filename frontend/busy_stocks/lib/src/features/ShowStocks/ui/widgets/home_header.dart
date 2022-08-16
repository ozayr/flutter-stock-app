import 'package:busy_stocks/src/features/ShowStocks/services/refresh_service.dart';
import 'package:busy_stocks/src/globals/layout/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Mphati',
                style: kSmallHeaderText,
              ),
              Text(
                'Welcome back to BusyStocks',
                style: kSmallSubText,
              ),
            ],
          ),
          IconButton(
              onPressed: () => ref.refresh(appRefreshProvider),
              icon: Icon(
                Icons.refresh,
                color: kSecondaryColor,
              ))
        ],
      ),
    );
  }
}
