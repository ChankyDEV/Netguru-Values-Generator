import 'package:netguru_values_generator/keys.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/reposiories/user_presence/user_presence_repository.dart';
import 'package:netguru_values_generator/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPresenceRepositoryImpl implements UserPresenceRepository {
  final SharedPreferences _preferences;

  UserPresenceRepositoryImpl(this._preferences);

  @override
  Future<bool> isEnteringFirstTime() async {
    final userPresence =
        _preferences.getBool(SharedPreferencesKeys.userPresence);
    final isFirstTime = userPresence == null;
    return Future.value(isFirstTime);
  }

  @override
  Future<void> saveUserPresence() async {
    final isSaved = await _preferences.setBool(
      SharedPreferencesKeys.userPresence,
      true,
    );
    if (!isSaved) {
      throw UserPresenceException(
          message: UserPresenceErrorMessages.cantSaveUserPresence);
    }
  }
}
