import 'package:go_router/go_router.dart';
import 'pages/user/forgot_password_page.dart';
import 'pages/user/login_page.dart';
import 'pages/user/sign_up_page.dart';

final router = GoRouter(
  initialLocation: '/user/login',
  routes: [
    // User module
    GoRoute(
      path: '/user/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/user/forgot-password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/user/sign-up',
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);
