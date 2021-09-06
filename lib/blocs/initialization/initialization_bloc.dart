import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netguru_values_generator/services/user_presence/user_presence_service.dart';

part 'initialization_bloc.freezed.dart';

part 'initialization_event.dart';

part 'initialization_state.dart';

class InitializationBloc
    extends Bloc<InitializationEvent, InitializationState> {
  final UserPresenceService userPresenceService;

  InitializationBloc(this.userPresenceService)
      : super(
          InitializationState.initial(
            isLoading: true,
            didConfigureApp: false,
            hasError: false,
          ),
        );

  void configureApp() {
    this.add(InitializationEvent.configureApp());
  }

  @override
  Stream<InitializationState> mapEventToState(
      InitializationEvent event) async* {
    yield* event.map(
      configureApp: _configureApp,
    );
  }

  Stream<InitializationState> _configureApp(ConfigureApp value) async* {
    final failureOrUnit = await userPresenceService.configureApp();
    yield failureOrUnit.fold<InitializationState>(
      (_) => showError(),
      (_) => moveToSentences(),
    );
  }

  InitializationState moveToSentences() {
    return state.copyWith(
      isLoading: false,
      didConfigureApp: true,
    );
  }

  InitializationState showError() {
    return state.copyWith(
      isLoading: false,
      didConfigureApp: false,
    );
  }
}
