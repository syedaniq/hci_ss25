import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('AppBar New'), backgroundColor: Colors.amber),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 100,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(21)),
              ),
            ),
            Expanded(flex: 2, child: Container(height: 100, color: Colors.red)),
            Expanded(child: Container(height: 100, color: Colors.amber)),
          ],
        ),
      ),
    );
  }
}
