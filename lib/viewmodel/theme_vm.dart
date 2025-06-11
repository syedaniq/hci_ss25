import 'package:june/june.dart';

class ThemeVM extends JuneState {
  bool darkMode = false;

  void toggleTheme() {
    darkMode = !darkMode;
    setState();
  }
}
