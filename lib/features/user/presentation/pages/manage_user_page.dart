import 'package:flutter/material.dart';

class ManageUserPage extends StatelessWidget {
  const ManageUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Usuário'),
      ),
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