import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_user_state.freezed.dart';

@freezed
abstract class ManageUserState with _$ManageUserState {
  const factory ManageUserState({
    String? userId,
    String? userName,
    String? userEmail,
    int? userAge,
    bool? userIsActive,
    @Default(false) bool isLoading,
    @Default("") String errorMessage,
    @Default(false) bool isSuccess,
  }) = _MangeUserState;
}
