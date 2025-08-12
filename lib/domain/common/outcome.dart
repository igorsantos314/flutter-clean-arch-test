// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outcome.freezed.dart';

@freezed
sealed class Outcome<S, E> with _$Outcome<S, E> {
  const factory Outcome.success({
    S? value,
  }) = _Success;

  const factory Outcome.failure({
    required E error,
    String? message,
    Object? throwable,
  }) = _Failure;
}