import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../consts/index.dart';

extension BuildContextExt on BuildContext {
  double calcNonScrollablePageHeight() {
    return MediaQuery.of(this).size.height -
        MediaQuery.of(this).padding.top -
        MediaQuery.of(this).padding.bottom;
  }

  int calcCacheWidth(double width) {
    return (width * MediaQuery.of(this).devicePixelRatio).toInt();
  }

  int calcCacheHeight(double height) {
    return calcCacheWidth(height);
  }

  void notify({
    required Widget content,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 4),
  }) {
    final localizations = AppLocalizations.of(this)!;
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: content,
        action: SnackBarAction(
          label: localizations.close,
          onPressed: () =>
              scaffoldMessengerKey.currentState?.hideCurrentSnackBar(),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: duration,
      ),
    );
  }
}
