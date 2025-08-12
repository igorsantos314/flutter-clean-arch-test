import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/core/di/app_locator.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/cubit/user_list_cubit.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListCubit(getIt.get<UserRepository>()),
      child: const UserListPageContent(),
    );
  }
}

class UserListPageContent extends StatelessWidget {
  const UserListPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserListCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Usuários')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Lista de usuários será exibida aqui.'),
            ElevatedButton(
              onPressed: () {
                // Ação para carregar a lista de usuários
              },
              child: const Text('Carregar Usuários'),
            ),
          ],
        ),
      ),
    );
  }
}
