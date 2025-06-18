import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/viewmodel/theme_vm.dart';
import 'package:june/state_manager/src/simple/state.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      () => ThemeVM(),
      builder: (controller) {
        controller.loadThemePreferences();

        return MaterialApp(title: 'Flutter Demo', theme: controller.darkMode ? ThemeData.dark() : ThemeData.light(), home: HomePage());
      },
    );
  }
}
