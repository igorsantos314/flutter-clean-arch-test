import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/core/di/app_locator.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/cubit/user_list_cubit.dart';
import 'package:go_router/go_router.dart';

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
      body: BlocListener<UserListCubit, UserListState>(
        listener: (context, state) {
          log('UserListCubit state: $state');

          if (state.shouldNavigateToAddUser) {
            // Dispara a navegação aqui
            context.go(
              '/manage_user',
            ); // Exemplo: navega para a rota de adicionar usuário

            // É CRUCIAL resetar a flag no Cubit para evitar navegações repetidas
            context.read<UserListCubit>().navigateToUserAddCompleted();
          }

          // Lógica para dialogs de erro (já discutida)
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error?.message ?? 'Erro desconhecido'),
              ),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              // <-- Adicionei o Expanded aqui!
              child: BlocBuilder<UserListCubit, UserListState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.error != null) {
                    return Center(child: Text('Erro: ${state.error?.message}'));
                  }

                  if (state.users.isNotEmpty) {
                    final users = state.users;
                    if (users.isEmpty) {
                      return const Center(
                        child: Text('Nenhum usuário cadastrado.'),
                      );
                    }

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user =
                            users[index]; // Acessa o usuário da lista no estado
                        return ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.email),
                          // Você pode adicionar mais ações aqui como editar/excluir
                        );
                      },
                    );
                  }

                  if (state.users.isEmpty) {
                    return Center(child: Text("Nenhum usuário encontrado"));
                  }

                  return const Center(child: Text('Estado desconhecido'));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Dispara a ação de carregar usuários no Cubit
          userCubit.goToCreateUserForm();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Center initialState({Function? onPressed}) => Center(
    child: Column(
      children: [
        Text('Pressione o botão para carregar usuários.'),
        ElevatedButton(
          onPressed: () => onPressed?.call(),
          child: Text("Carregar Usuários"),
        ),
      ],
    ),
  );
}
