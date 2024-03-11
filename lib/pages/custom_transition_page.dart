import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

extension CustomTransitionPageExt on CustomTransitionPage {
  static CustomTransitionPage build({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      barrierColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(
            Tween(begin: const Offset(1, 0), end: Offset.zero).chain(
              CurveTween(curve: Curves.easeOut),
            ),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
