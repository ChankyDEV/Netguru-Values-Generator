import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

class MockUuidGenerator extends Mock implements Uuid {
  @override
  String v4({Map<String, dynamic>? options}) {
    return super.noSuchMethod(
      Invocation.method(#v4, null, {
        #options: options,
      }),
      returnValueForMissingStub: '',
      returnValue: '',
    );
  }
}
