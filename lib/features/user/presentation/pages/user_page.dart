import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/cubit/user_cubit.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Usuário (BLoC/Cubit)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder escuta as mudanças de estado do UserCubit
            // e reconstrói sua parte da UI de acordo.
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserInitial) {
                  return const Text('Pressione o botão para carregar o usuário.');
                } else if (state is UserLoading) {
                  return const CircularProgressIndicator();
                } else if (state is UserLoaded) {
                  return Column(
                    children: [
                      Text('ID: ${state.user.id}'),
                      Text('Nome: ${state.user.name}'),
                      Text('Email: ${state.user.email}'),
                    ],
                  );
                } else if (state is UserError) {
                  return Text('Erro: ${state.message}', style: const TextStyle(color: Colors.red));
                }
                return const SizedBox.shrink(); // Caso padrão, não deveria acontecer
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acessa o Cubit e chama o método para buscar o usuário.
                // context.read<UserCubit>() é uma extensão de Flutter Bloc para acessar o Cubit.
                context.read<UserCubit>().getUser('123'); // Carrega um usuário existente
              },
              child: const Text('Carregar Usuário 123'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<UserCubit>().getUser('456'); // Carrega um usuário inexistente (para ver o erro)
              },
              child: const Text('Carregar Usuário 456 (Erro)'),
            ),
          ],
        ),
      ),
    );
  }
}