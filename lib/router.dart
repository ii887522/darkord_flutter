import 'package:go_router/go_router.dart';
import 'pages/auth/login_page.dart';

final router = GoRouter(
  initialLocation: '/auth/login',
  routes: [
    GoRoute(path: '/auth/login', builder: (context, state) => const LoginPage())
  ],
);
