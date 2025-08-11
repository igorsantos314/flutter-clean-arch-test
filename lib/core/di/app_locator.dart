import 'package:flutter_clean_arch_test/core/di/user_locator.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  initUserLocator();
}