import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/features/user/domain/model/user.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';

abstract class UserState extends Equatable {
  const UserState();

  /// The list of properties that will be used to determine whether two instances are equal
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;
  const UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  
  /// Construtor: inicializa o Cubit com o estado inicial e injeta o repositório.
  UserCubit(this._userRepository) : super(UserInitial());

  /// Método para carregar um usuário pelo ID.
  /// Este método é chamado pela UI.
  Future<void> getUser(String id) async {
    try {
      emit(UserLoading()); // 1. Emite estado de carregamento
      final user = await _userRepository.fetchUser(id); // 2. Chama o repositório
      emit(UserLoaded(user)); // 3. Emite estado de sucesso com o usuário
    } catch (e) {
      emit(UserError(e.toString())); // 4. Emite estado de erro se algo falhar
    }
  }
}