

part of 'initialization_bloc.dart';

@freezed
class InitializationEvent with _$InitializationEvent {
  const factory InitializationEvent.configureApp() = ConfigureApp;
}