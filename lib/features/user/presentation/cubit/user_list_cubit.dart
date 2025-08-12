import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/domain/common/error.dart';
import 'package:flutter_clean_arch_test/domain/common/outcome.dart';
import 'package:flutter_clean_arch_test/features/user/domain/model/user.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_cubit.freezed.dart';

@freezed
abstract class UserListState with _$UserListState {
  const factory UserListState({
    @Default(false) bool isLoading,
    @JsonKey(includeFromJson: false, includeToJson: false) AppError? error,
    @Default([]) List<User> users,
    @Default(false) bool shouldNavigateToAddUser,
  }) = _UserListState;
}

class UserListCubit extends Cubit<UserListState> {
  final UserRepository _userRepository;

  StreamSubscription<List<User>>? _usersSubscription;

  UserListCubit(this._userRepository) : super(UserListState());

  Future<void> loadUsers() async {
    await _startUserStreamListening();
  }

  Future<void> goToCreateUserForm() async {
    emit(state.copyWith(isLoading: true, shouldNavigateToAddUser: true));
  }

  Future<void> _startUserStreamListening() async {
    // Cancela qualquer inscrição anterior antes de criar uma nova
    await _usersSubscription?.cancel();

    emit(state.copyWith(isLoading: true));
    final outcome = await _userRepository.fetchAllUsers();

    outcome.when(
      success: (userStream) {
        // 3. Se a obtenção da Stream foi um sucesso, inscreva-se nela
        _usersSubscription = userStream?.listen(
          (users) {
            // A cada nova emissão da Stream, emite o estado carregado
            emit(state.copyWith(isLoading: false, users: users));
          },
          onError: (error) {
            // Se um erro ocorrer DENTRO da Stream (após a inicialização bem-sucedida)
            emit(
              state.copyWith(
                isLoading: false,
                error: GenericError(message: error.toString()),
              ),
            );
          },
          onDone: () {
            // Opcional: A Stream foi concluída
            log('Stream de usuários finalizada.');
          },
        );
      },
      failure: (error, _, _) {
        // Se a obtenção da Stream FALHAR (erro na camada de repositório, por exemplo)
        emit(state.copyWith(error: error));
      },
    );
  }

  void navigateToUserAddCompleted() {
    emit(state.copyWith(isLoading: false));
  }

  @override
  Future<void> close() {
    _usersSubscription?.cancel(); // Cancela a inscrição ao fechar o Cubit
    return super.close();
  }
}
