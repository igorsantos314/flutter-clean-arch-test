// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Outcome<S,E> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Outcome<S, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Outcome<$S, $E>()';
}


}

/// @nodoc
class $OutcomeCopyWith<S,E,$Res>  {
$OutcomeCopyWith(Outcome<S, E> _, $Res Function(Outcome<S, E>) __);
}


/// Adds pattern-matching-related methods to [Outcome].
extension OutcomePatterns<S,E> on Outcome<S, E> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Success<S, E> value)?  success,TResult Function( _Failure<S, E> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Success<S, E> value)  success,required TResult Function( _Failure<S, E> value)  failure,}){
final _that = this;
switch (_that) {
case _Success():
return success(_that);case _Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Success<S, E> value)?  success,TResult? Function( _Failure<S, E> value)?  failure,}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( S? value)?  success,TResult Function( E error,  String? message,  Object? throwable)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.value);case _Failure() when failure != null:
return failure(_that.error,_that.message,_that.throwable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( S? value)  success,required TResult Function( E error,  String? message,  Object? throwable)  failure,}) {final _that = this;
switch (_that) {
case _Success():
return success(_that.value);case _Failure():
return failure(_that.error,_that.message,_that.throwable);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( S? value)?  success,TResult? Function( E error,  String? message,  Object? throwable)?  failure,}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.value);case _Failure() when failure != null:
return failure(_that.error,_that.message,_that.throwable);case _:
  return null;

}
}

}

/// @nodoc


class _Success<S,E> implements Outcome<S, E> {
  const _Success({this.value});
  

 final  S? value;

/// Create a copy of Outcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<S, E, _Success<S, E>> get copyWith => __$SuccessCopyWithImpl<S, E, _Success<S, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success<S, E>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'Outcome<$S, $E>.success(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<S,E,$Res> implements $OutcomeCopyWith<S, E, $Res> {
  factory _$SuccessCopyWith(_Success<S, E> value, $Res Function(_Success<S, E>) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 S? value
});




}
/// @nodoc
class __$SuccessCopyWithImpl<S,E,$Res>
    implements _$SuccessCopyWith<S, E, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<S, E> _self;
  final $Res Function(_Success<S, E>) _then;

/// Create a copy of Outcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(_Success<S, E>(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as S?,
  ));
}


}

/// @nodoc


class _Failure<S,E> implements Outcome<S, E> {
  const _Failure({required this.error, this.message, this.throwable});
  

 final  E error;
 final  String? message;
 final  Object? throwable;

/// Create a copy of Outcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<S, E, _Failure<S, E>> get copyWith => __$FailureCopyWithImpl<S, E, _Failure<S, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure<S, E>&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.throwable, throwable));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),message,const DeepCollectionEquality().hash(throwable));

@override
String toString() {
  return 'Outcome<$S, $E>.failure(error: $error, message: $message, throwable: $throwable)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<S,E,$Res> implements $OutcomeCopyWith<S, E, $Res> {
  factory _$FailureCopyWith(_Failure<S, E> value, $Res Function(_Failure<S, E>) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 E error, String? message, Object? throwable
});




}
/// @nodoc
class __$FailureCopyWithImpl<S,E,$Res>
    implements _$FailureCopyWith<S, E, $Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure<S, E> _self;
  final $Res Function(_Failure<S, E>) _then;

/// Create a copy of Outcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? message = freezed,Object? throwable = freezed,}) {
  return _then(_Failure<S, E>(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as E,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,throwable: freezed == throwable ? _self.throwable : throwable ,
  ));
}


}

// dart format on
