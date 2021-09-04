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

  @override
  Future<bool> setBool(String? key, bool? value) {
    return super.noSuchMethod(
      Invocation.method(#setString, [key, value]),
      returnValueForMissingStub: Future.value(true),
      returnValue: Future.value(true),
    );
  }

  @override
  bool? getBool(String? key) {
    return super.noSuchMethod(
      Invocation.method(#getBool, [key]),
      returnValueForMissingStub: true,
      returnValue: true,
    );
  }
}
