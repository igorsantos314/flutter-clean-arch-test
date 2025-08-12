import 'package:flutter_clean_arch_test/features/user/presentation/pages/manage_user_page.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/pages/user_list_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static GoRouter get routes => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const UserListPage()),
      GoRoute(path: '/manage_user/:userId', builder: (context, state) {
        final userId = state.pathParameters['userId'];
        return ManageUserPage();
      }),
    ],
  );
}
