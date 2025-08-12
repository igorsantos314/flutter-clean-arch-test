import 'package:flutter_clean_arch_test/core/database/database.dart';
import 'package:flutter_clean_arch_test/core/di/app_locator.dart';

void initDatabaseLocator() {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
}