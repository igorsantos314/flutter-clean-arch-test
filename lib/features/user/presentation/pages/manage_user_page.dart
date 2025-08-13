import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/cubit/manage_user_cubit.dart';
import 'package:flutter_clean_arch_test/core/di/app_locator.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/states/manage_user_state.dart';
import 'package:go_router/go_router.dart';

class ManageUserPage extends StatelessWidget {
  final String? userId;
  const ManageUserPage({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageUserCubit(getIt.get<UserRepository>()),
      child: ManageUserPageContent(userId: userId),
    );
  }
}

class ManageUserPageContent extends StatefulWidget {
  final String? userId;
  const ManageUserPageContent({super.key, this.userId});

  @override
  State<ManageUserPageContent> createState() => _ManageUserPageContentState();
}

class _ManageUserPageContentState extends State<ManageUserPageContent> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _ageController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _ageController = TextEditingController();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      final userCubit = context.read<ManageUserCubit>();
      userCubit.fetchUser(widget.userId);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final manageUserCubit = context.read<ManageUserCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userId == null ? 'Cadastrar Usuário' : 'Editar Usuário',
        ),
      ),
      body: BlocListener<ManageUserCubit, ManageUserState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sucesso!')),
            );
            manageUserCubit.resetSuccessState();
            context.pop();
          }

          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errorMessage}')),
            );
            manageUserCubit.resetErrorStatus();
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (widget.userId != null)
                BlocSelector<ManageUserCubit, ManageUserState, String>(
                  selector: (state) => state.userId ?? '',
                  builder: (context, userId) {
                    return Text(
                      'ID do Usuário: $userId',
                      style: const TextStyle(fontSize: 16.0),
                    );
                  },
                ),
              const SizedBox(height: 16.0),
              BlocSelector<ManageUserCubit, ManageUserState, String>(
                selector: (state) => state.userName ?? '',
                builder: (context, name) {
                  if (_nameController.text != name) {
                    _nameController.text = name;
                    _nameController.selection = TextSelection.collapsed(
                      offset: name.length,
                    );
                  }
                  return TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: manageUserCubit.updateUserName,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              BlocSelector<ManageUserCubit, ManageUserState, String>(
                selector: (state) => state.userEmail ?? '',
                builder: (context, email) {
                  if (_emailController.text != email) {
                    _emailController.text = email;
                    _emailController.selection = TextSelection.collapsed(
                      offset: email.length,
                    );
                  }
                  return TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: manageUserCubit.updateUserEmail,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              BlocSelector<ManageUserCubit, ManageUserState, int>(
                selector: (state) => state.userAge ?? 0,
                builder: (context, age) {
                  if (_ageController.text != age.toString()) {
                    _ageController.text = age.toString();
                    _ageController.selection = TextSelection.collapsed(
                      offset: age.toString().length,
                    );
                  }
                  return TextField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                      labelText: 'Idade',   
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final parsedAge = int.tryParse(value);
                      if (parsedAge != null) {
                        manageUserCubit.updateUserAge(parsedAge);
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 16.0),

              ElevatedButton(onPressed: () { manageUserCubit.save(); }, child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.save),
                  SizedBox(width: 8.0),
                  Text(widget.userId == null ? "Salvar" : "Atualizar"),
                ],
              )),

              if (widget.userId != null)
                ElevatedButton(onPressed: manageUserCubit.delete, child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 8.0),
                    Text("Excluir Usuário"),
                  ],
                )),
            ],
          ),
        ),
      ),
    );
  }
}
