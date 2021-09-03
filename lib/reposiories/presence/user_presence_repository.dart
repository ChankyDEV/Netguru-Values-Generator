abstract class UserPresenceRepository {
  Future<bool> isEnteringFirstTime();

  Future<void> saveUserPresence();
}
