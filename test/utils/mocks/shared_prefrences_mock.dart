import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {
  @override
  String? getString(String? key) {
    return super.noSuchMethod(
      Invocation.method(#getString, [key]),
      returnValueForMissingStub: '',
      returnValue: '',
    );
  }

  @override
  Future<bool> setString(String? key, String? value) {
    return super.noSuchMethod(
      Invocation.method(#setString, [key, value]),
      returnValueForMissingStub: Future.value(true),
      returnValue: Future.value(true),
    );
  }
}
