import 'package:cointicker/config/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:cointicker

class PersistenceService {
  static final PersistenceService _manager = PersistenceService._internal();
  SharedPreferences? _preferences;

  factory PersistenceService() {
    return _manager;
  }

//This makes sure preference is loaded.
  Future<void> _ensurePreferenceLoaded() async {
    _manager._preferences ??= await SharedPreferences.getInstance();
  }

  Future<bool> getSignInStatus() async {
    await _manager._ensurePreferenceLoaded();
    return Future.value(
      _manager._preferences!.getBool(PrefKeys.signInStatusKey) ?? false,
    );
  }

  Future<void> saveSignInStatus(bool signInStatus) async {
    await _manager._ensurePreferenceLoaded();
    _manager._preferences!.setBool(PrefKeys.signInStatusKey, signInStatus);
  }

  Future<void> saveUserEmail(String userEmail) async {
    await _manager._ensurePreferenceLoaded();
    _manager._preferences!.setString(PrefKeys.userEmail, userEmail);
  }

  Future<String?> getUserEmail() async {
    await _manager._ensurePreferenceLoaded();
    return _manager._preferences!.getString(PrefKeys.userEmail);
  }

  Future<void> saveUserName(String userName) async {
    await _manager._ensurePreferenceLoaded();
    _manager._preferences!.setString(PrefKeys.userName, userName);
  }

  Future<String?> getUserName() async {
    await _manager._ensurePreferenceLoaded();
    return _manager._preferences!.getString(PrefKeys.userName);
  }

  Future<void> saveThemeMode(String themeMode) async {
    await _manager._ensurePreferenceLoaded();
    _manager._preferences!.setString(PrefKeys.themeMode, themeMode);
  }

  Future<String?> getThemeMode() async {
    await _manager._ensurePreferenceLoaded();
    return _manager._preferences!.getString(PrefKeys.themeMode);
  }

  PersistenceService._internal();
}
