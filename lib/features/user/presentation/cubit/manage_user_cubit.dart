import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch_test/domain/common/outcome.dart';
import 'package:flutter_clean_arch_test/features/user/domain/model/user.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';
import 'package:flutter_clean_arch_test/features/user/presentation/states/manage_user_state.dart';

class ManageUserCubit extends Cubit<ManageUserState> {
  final UserRepository _userRepository;
  int? _currentUserId;

  ManageUserCubit(
    this._userRepository,
  ) : super(ManageUserState());

  void fetchUser(String? userId) {
    emit(state.copyWith(isLoading: true));

    _currentUserId = int.tryParse(userId ?? "");
    log("Fetching user with ID: $_currentUserId");

    if (_currentUserId == null) {
      emit(state.copyWith(isLoading: false, isSuccess: false));
      return;
    }

    _userRepository.fetchUser(userId ?? "").then((outcome) {
      outcome.when(
        success: (user) {
          if (user != null) {
            emit(state.copyWith(
              isLoading: false,
              userName: user.name,
              userEmail: user.email,
              userAge: user.age,
              userIsActive: user.isActive,
            ));
          } else {
            emit(state.copyWith(isLoading: false, isSuccess: false));
          }
        },
        failure: (error, message, stackTrace) {
          emit(state.copyWith(isLoading: false, errorMessage: error.message.toString()));
        },
      );
    });
  }

  void save() {
    final user = User(
      id: _currentUserId,
      name: state.userName ?? "",
      email: state.userEmail ?? "",
      age: state.userAge ?? 0,
      isActive: state.userIsActive ?? true,
    );

    log(" Saving user: ${user.toJson()}");

    if (_currentUserId == null) {
      _userRepository.createUser(user).then((outcome) {
        outcome.when(
          success: (id) {
            emit(state.copyWith(isSuccess: true, userId: id.toString()));
          },
          failure: (error, message, stackTrace) {
            emit(state.copyWith(errorMessage: error.message.toString()));
          },
        );
      });
    } else {
      _userRepository.updateUser(user).then((outcome) {
        outcome.when(
          success: (isUpdated) {
            emit(state.copyWith(isSuccess: isUpdated ?? false));
          },
          failure: (error, message, stackTrace) {
            emit(state.copyWith(errorMessage: error.message.toString()));
          },
        );
      });
    }
  }

  void updateUserName(String name) {
    emit(state.copyWith(userName: name));
  }

  void updateUserEmail(String email) {
    emit(state.copyWith(userEmail: email));
  }

  void updateUserAge(int age) {
    emit(state.copyWith(userAge: age));
  }

  void resetSuccessState() {
    emit(state.copyWith(isSuccess: false));
  }

  void resetErrorStatus() {
    emit(state.copyWith(errorMessage: ""));
  }
}