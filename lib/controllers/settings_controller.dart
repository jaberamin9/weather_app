import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsProvider = StateNotifierProvider<SettingsController, bool>((ref) {
  return SettingsController();
});

class SettingsController extends StateNotifier<bool> {
  SettingsController() : super(false) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('ftoc') ?? false;
  }

  void toggle() {
    state = !state;
    saveSettings(state);
  }

  Future<void> saveSettings(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('ftoc', value);
  }
}
