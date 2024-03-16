import 'package:go_router/go_router.dart';

import 'pages/custom_transition_page.dart';
import 'pages/user/forgot_password_page.dart';
import 'pages/user/login_page.dart';
import 'pages/user/reset_password_page.dart';
import 'pages/user/sign_up_page.dart';

final router = GoRouter(
  routes: [
    // User module
    GoRoute(
      path: '/',
      redirect: (context, state) => '/user/login',
    ),
    GoRoute(
      path: '/user/login',
      pageBuilder: (context, state) {
        return CustomTransitionPageExt.build(
          context: context,
          state: state,
          child: const LoginPage(),
        );
      },
    ),
    GoRoute(
      path: '/user/forgot-password',
      pageBuilder: (context, state) {
        return CustomTransitionPageExt.build(
          context: context,
          state: state,
          child: const ForgotPasswordPage(),
        );
      },
    ),
    GoRoute(
      path: '/user/sign-up',
      pageBuilder: (context, state) {
        return CustomTransitionPageExt.build(
          context: context,
          state: state,
          child: const SignUpPage(),
        );
      },
    ),
    GoRoute(
      path: '/user/reset-password/:emailAddr',
      pageBuilder: (context, state) {
        return CustomTransitionPageExt.build(
          context: context,
          state: state,
          child: ResetPasswordPage(
            emailAddr: state.pathParameters['emailAddr']!,
          ),
        );
      },
    ),
  ],
);
