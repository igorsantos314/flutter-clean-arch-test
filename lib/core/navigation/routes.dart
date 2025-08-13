import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/pages/manage_user_page.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/pages/user_list_page.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {

  static const String homeRoute = '/';
  static const String addUserRoute = '/add_user';
  static const String manageUserRoute = '/manage_user/:userId';

  static GoRouter get routes => GoRouter(
    initialLocation: homeRoute,
    routes: [
      GoRoute(path: homeRoute, builder: (context, state) => const UserListPage()),
      GoRoute(path: addUserRoute, builder: (context, state) => 
        ManageUserPage()
      ),
      GoRoute(path: AppNavigation.manageUserRoute, builder: (context, state) {
        final userId = state.pathParameters['userId'];
        log("Navigating to ManageUserPage with userId: $userId");

        return ManageUserPage(userId: userId,);
      }),
    ],
  );

  static void navigateToMangeUserPage(
    BuildContext context, {
    String? userId,
  }) {
    final route = _getManageUserRoute(userId);
    log("Navigating to ManageUserPage with route: $route");
    context.push(route);
  }

  static String _getManageUserRoute(String? userId) {
    if (userId == null || userId.isEmpty) {
      log("User ID is null or empty, navigating to add user page.");
      return addUserRoute;
    }

    final route = manageUserRoute.replaceAll(":userId", userId);
    return route;
  }
}
