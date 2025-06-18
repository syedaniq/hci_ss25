import 'package:june/june.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeVM extends JuneState {
  bool darkMode = false;

  Future<void> loadThemePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    darkMode = prefs.getBool('dark_mode_enabled') ?? false;
    setState();
  }

  void toggleTheme() async {
    darkMode = !darkMode;

    final prefs = await SharedPreferences.getInstance();
    darkMode = await prefs.setBool('dark_mode_enabled', darkMode);

    setState();
  }
}
