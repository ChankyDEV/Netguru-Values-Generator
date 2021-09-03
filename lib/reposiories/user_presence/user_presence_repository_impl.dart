import 'package:netguru_values_generator/reposiories/user_presence/user_presence_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPresenceRepositoryImpl implements UserPresenceRepository {

  final SharedPreferences _preferences;

  UserPresenceRepositoryImpl(this._preferences);

  @override
  Future<bool> isEnteringFirstTime() {
    // TODO: implement isEnteringFirstTime
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserPresence() {
    // TODO: implement saveUserPresence
    throw UnimplementedError();
  }

}