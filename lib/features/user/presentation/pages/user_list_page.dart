import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
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