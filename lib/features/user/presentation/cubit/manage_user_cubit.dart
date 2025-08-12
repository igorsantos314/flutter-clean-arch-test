import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';

abstract class ManageUserState {}

class InitialManageUserState extends ManageUserState {}
class LoadingManageUserState extends ManageUserState {}
class LoadedManageUserState extends ManageUserState {}
class ErrorManageUserState extends ManageUserState {
  final String message;
  ErrorManageUserState(this.message);
} 

class ManageUserCubit extends Cubit<ManageUserState> {
  final UserRepository _userRepository;
  
  ManageUserCubit(
    this._userRepository,
  ) : super(InitialManageUserState());
}