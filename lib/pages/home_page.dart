import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/album_page.dart';
import 'package:flutter_application_1/pages/create_studi_page.dart';
import 'package:flutter_application_1/viewmodel/student_vm.dart';
import 'package:flutter_application_1/viewmodel/theme_vm.dart';
import 'package:june/june.dart';

import '../widgets/studi_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: JuneBuilder(
          () => ThemeVM(),
          builder: (controller) {
            return Text('AppBar', style: TextStyle(color: controller.darkMode ? Colors.red : Colors.black));
          },
        ),

        backgroundColor: Colors.amber,
        actions: [
          Switch(
            // This bool value toggles the switch.
            value: June.getState(() => ThemeVM()).darkMode,
            activeColor: Colors.red,
            onChanged: (bool value) {
              June.getState(() => ThemeVM()).toggleTheme();
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        destinations: [
          NavigationDestination(selectedIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(selectedIcon: Icon(Icons.album), icon: Icon(Icons.album_outlined), label: 'Album'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateStudiPage()));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateStudiPage()));
        },
      ),
      body: [
        SingleChildScrollView(
          child: JuneBuilder(
            () => StudentVM(),
            builder: (controller) {
              return Column(
                children: [
                  for (final student in controller.studis)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      child: StudiContainer(name: student.name, uni: student.hochschule),
                    ),
                ],
              );
            },
          ),
        ),
        AlbumPage(),
      ][currentPageIndex],
    );
  }
}
