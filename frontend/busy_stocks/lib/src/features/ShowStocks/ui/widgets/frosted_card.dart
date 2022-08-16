import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedCard extends StatelessWidget {
  const FrostedCard({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white30, Colors.white.withOpacity(0.01)]),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.white30)),
              child: child,
            ),
          ),
        ));
  }
}
