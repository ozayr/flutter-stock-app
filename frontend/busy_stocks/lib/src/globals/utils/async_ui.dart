import 'package:busy_stocks/src/globals/widgets/alert_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isRefreshing && hasError) {
      showExceptionAlertDialog(
        context: context,
        title: 'Error',
        exception: error,
      );
    }
  }
}