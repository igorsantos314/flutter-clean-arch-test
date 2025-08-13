// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManageUserState {

 String? get userId; String? get userName; String? get userEmail; int? get userAge; bool? get userIsActive; bool get isLoading; String get errorMessage; bool get isSuccess;
/// Create a copy of ManageUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageUserStateCopyWith<ManageUserState> get copyWith => _$ManageUserStateCopyWithImpl<ManageUserState>(this as ManageUserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageUserState&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.userAge, userAge) || other.userAge == userAge)&&(identical(other.userIsActive, userIsActive) || other.userIsActive == userIsActive)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userName,userEmail,userAge,userIsActive,isLoading,errorMessage,isSuccess);

@override
String toString() {
  return 'ManageUserState(userId: $userId, userName: $userName, userEmail: $userEmail, userAge: $userAge, userIsActive: $userIsActive, isLoading: $isLoading, errorMessage: $errorMessage, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $ManageUserStateCopyWith<$Res>  {
  factory $ManageUserStateCopyWith(ManageUserState value, $Res Function(ManageUserState) _then) = _$ManageUserStateCopyWithImpl;
@useResult
$Res call({
 String? userId, String? userName, String? userEmail, int? userAge, bool? userIsActive, bool isLoading, String errorMessage, bool isSuccess
});




}
/// @nodoc
class _$ManageUserStateCopyWithImpl<$Res>
    implements $ManageUserStateCopyWith<$Res> {
  _$ManageUserStateCopyWithImpl(this._self, this._then);

  final ManageUserState _self;
  final $Res Function(ManageUserState) _then;

/// Create a copy of ManageUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? userName = freezed,Object? userEmail = freezed,Object? userAge = freezed,Object? userIsActive = freezed,Object? isLoading = null,Object? errorMessage = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,userAge: freezed == userAge ? _self.userAge : userAge // ignore: cast_nullable_to_non_nullable
as int?,userIsActive: freezed == userIsActive ? _self.userIsActive : userIsActive // ignore: cast_nullable_to_non_nullable
as bool?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ManageUserState].
extension ManageUserStatePatterns on ManageUserState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangeUserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangeUserState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangeUserState value)  $default,){
final _that = this;
switch (_that) {
case _MangeUserState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangeUserState value)?  $default,){
final _that = this;
switch (_that) {
case _MangeUserState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userId,  String? userName,  String? userEmail,  int? userAge,  bool? userIsActive,  bool isLoading,  String errorMessage,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangeUserState() when $default != null:
return $default(_that.userId,_that.userName,_that.userEmail,_that.userAge,_that.userIsActive,_that.isLoading,_that.errorMessage,_that.isSuccess);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userId,  String? userName,  String? userEmail,  int? userAge,  bool? userIsActive,  bool isLoading,  String errorMessage,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _MangeUserState():
return $default(_that.userId,_that.userName,_that.userEmail,_that.userAge,_that.userIsActive,_that.isLoading,_that.errorMessage,_that.isSuccess);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userId,  String? userName,  String? userEmail,  int? userAge,  bool? userIsActive,  bool isLoading,  String errorMessage,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _MangeUserState() when $default != null:
return $default(_that.userId,_that.userName,_that.userEmail,_that.userAge,_that.userIsActive,_that.isLoading,_that.errorMessage,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _MangeUserState implements ManageUserState {
  const _MangeUserState({this.userId, this.userName, this.userEmail, this.userAge, this.userIsActive, this.isLoading = false, this.errorMessage = "", this.isSuccess = false});
  

@override final  String? userId;
@override final  String? userName;
@override final  String? userEmail;
@override final  int? userAge;
@override final  bool? userIsActive;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of ManageUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangeUserStateCopyWith<_MangeUserState> get copyWith => __$MangeUserStateCopyWithImpl<_MangeUserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangeUserState&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.userAge, userAge) || other.userAge == userAge)&&(identical(other.userIsActive, userIsActive) || other.userIsActive == userIsActive)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userName,userEmail,userAge,userIsActive,isLoading,errorMessage,isSuccess);

@override
String toString() {
  return 'ManageUserState(userId: $userId, userName: $userName, userEmail: $userEmail, userAge: $userAge, userIsActive: $userIsActive, isLoading: $isLoading, errorMessage: $errorMessage, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$MangeUserStateCopyWith<$Res> implements $ManageUserStateCopyWith<$Res> {
  factory _$MangeUserStateCopyWith(_MangeUserState value, $Res Function(_MangeUserState) _then) = __$MangeUserStateCopyWithImpl;
@override @useResult
$Res call({
 String? userId, String? userName, String? userEmail, int? userAge, bool? userIsActive, bool isLoading, String errorMessage, bool isSuccess
});




}
/// @nodoc
class __$MangeUserStateCopyWithImpl<$Res>
    implements _$MangeUserStateCopyWith<$Res> {
  __$MangeUserStateCopyWithImpl(this._self, this._then);

  final _MangeUserState _self;
  final $Res Function(_MangeUserState) _then;

/// Create a copy of ManageUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? userName = freezed,Object? userEmail = freezed,Object? userAge = freezed,Object? userIsActive = freezed,Object? isLoading = null,Object? errorMessage = null,Object? isSuccess = null,}) {
  return _then(_MangeUserState(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,userAge: freezed == userAge ? _self.userAge : userAge // ignore: cast_nullable_to_non_nullable
as int?,userIsActive: freezed == userIsActive ? _self.userIsActive : userIsActive // ignore: cast_nullable_to_non_nullable
as bool?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
