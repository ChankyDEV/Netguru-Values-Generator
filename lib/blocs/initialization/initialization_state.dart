part of 'initialization_bloc.dart';

@freezed
class InitializationState with _$InitializationState {
  const factory InitializationState.initial({
    required bool isLoading,
    required bool didConfigureApp,
    required bool hasError,
  }) = Initial;
}
