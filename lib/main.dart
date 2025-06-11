import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:june/june.dart';

import 'models/theme_vm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      () => ThemeVM(),
      builder: (controller) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: controller.darkMode ? ThemeData.dark() : null,
          home: Scaffold(
            appBar: AppBar(title: Text('AppBar'), backgroundColor: Colors.amber),
            body: [
              HomePage(),
              Column(
                children: [
                  Text('Students'),
                  IconButton(
                    onPressed: () {
                      var state = June.getState(() => ThemeVM()).toggleTheme();
                      // state.darkMode = !state.darkMode;
                      // state.setState();
                    },
                    icon: Icon(Icons.dark_mode),
                  ),
                ],
              ),
            ][currentPageIndex],
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (value) => setState(() {
                currentPageIndex = value;
              }),
              selectedIndex: currentPageIndex,
              destinations: [
                NavigationDestination(selectedIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: 'Home'),
                NavigationDestination(selectedIcon: Icon(Icons.people), icon: Icon(Icons.people_outline), label: 'Students'),
              ],
            ),
          ),
        );
      },
    );
  }
}
