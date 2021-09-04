import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/keys.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/reposiories/user_presence/user_presence_repository.dart';
import 'package:netguru_values_generator/reposiories/user_presence/user_presence_repository_impl.dart';
import 'package:netguru_values_generator/utils/consts.dart';

import '../../utils/mocks/shared_prefrences_mock.dart';

void main() {
  late UserPresenceRepository repository;
  late MockSharedPreferences preferences;

  setUpAll(() {
    preferences = MockSharedPreferences();
    repository = UserPresenceRepositoryImpl(preferences);
  });

  group('isEnteringFirstTime', () {
    test('should return true if user enters first time', () async {
      when(preferences.getBool(any)).thenReturn(null);
      final result = await repository.isEnteringFirstTime();
      expect(result, true);
    });

    test('should return false if user not enters first time', () async {
      when(preferences.getBool(any)).thenReturn(null);
      final result = await repository.isEnteringFirstTime();
      expect(result, true);
    });
  });

  group('saveUserPresence', () {
    test('should call shared preferences to save presence on particular key',
        () async {
      await repository.saveUserPresence();
      verify(
        preferences.setBool(
          SharedPreferencesKeys.userPresence,
          true,
        ),
      );
    });

    test('should throw userPresence exception if unsuccessfully save presence',
        () async {
      when(
        preferences.setBool(any, any),
      ).thenAnswer((_) async => false);
      final call = repository.saveUserPresence;
      expect(
        () => call(),
        throwsA(
          UserPresenceException(
              message: UserPresenceErrorMessages.cantSaveUserPresence),
        ),
      );
    });
  });
}
