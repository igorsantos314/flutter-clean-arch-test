import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_test/core/di/app_locator.dart';
import 'package:flutter_clean_arch_test/core/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup dependecy Injection
  setupLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppNavigation.routes,
      title: 'Flutter Clean Architecture Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
