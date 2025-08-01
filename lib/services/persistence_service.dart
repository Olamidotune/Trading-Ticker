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

  PersistenceService._internal();
}
