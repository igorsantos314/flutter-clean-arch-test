import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/core/di/app_locator.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/cubit/user_cubit.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/pages/user_page.dart';

void main() async {
  // Setup dependecy Injection
  setupLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        // Fornece uma instância do UserCubit para a árvore de widgets abaixo.
        // O UserCubit é inicializado com a implementação real do repositório.
        create: (context) => UserCubit(getIt.get<UserRepository>()),
        child: const UserPage(),
      ),
    );
  }
}
