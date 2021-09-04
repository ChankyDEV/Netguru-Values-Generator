import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/reposiories/user_presence/user_presence_repository.dart';

class MockUserPresenceRepository extends Mock
    implements UserPresenceRepository {
  @override
  Future<bool> isEnteringFirstTime() {
    return super.noSuchMethod(
      Invocation.method(#isEnteringFirstTime, null),
      returnValueForMissingStub: Future.value(true),
      returnValue: Future.value(true),
    );
  }

  @override
  Future<void> saveUserPresence() {
    return super.noSuchMethod(
      Invocation.method(#saveUserPresence, null),
      returnValueForMissingStub: Future.value(),
      returnValue: Future.value(),
    );
  }
}
