import 'package:go_router/go_router.dart';
import 'pages/user/login_page.dart';

final router = GoRouter(
  initialLocation: '/user/login',
  routes: [
    // User module
    GoRoute(
      path: '/user/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
