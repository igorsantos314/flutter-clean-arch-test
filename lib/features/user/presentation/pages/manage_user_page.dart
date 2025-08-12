import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/cubit/manage_user_cubit.dart';
import 'package:flutter_clean_arch_test/core/di/app_locator.dart';

class ManageUserPage extends StatelessWidget {
  const ManageUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageUserCubit(getIt.get<UserRepository>()),
      child: const ManageUserPageContent(),
    );
  }
}

class ManageUserPageContent extends StatelessWidget {
  const ManageUserPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<ManageUserCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciar Usuário')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Página de Gerenciamento de Usuário'),
            ElevatedButton(
              onPressed: () {
                // Ação para gerenciar usuário
              },
              child: const Text('Gerenciar Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}
