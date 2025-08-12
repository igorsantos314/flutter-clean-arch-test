
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';

abstract class UserListState {}

class InitialUserListState extends UserListState {}
class LoadingUserListState extends UserListState {}
class LoadedUserListState extends UserListState {}
class ErrorUserListState extends UserListState {
  final String message;
  ErrorUserListState(this.message);
}

class UserListCubit extends Cubit<UserListState> {
  final UserRepository _userRepository;
  UserListCubit(
    this._userRepository,
  ) : super(InitialUserListState());
}