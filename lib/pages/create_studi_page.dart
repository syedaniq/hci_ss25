import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/viewmodel/student_vm.dart';
import 'package:june/june.dart';

class CreateStudiPage extends StatefulWidget {
  const CreateStudiPage({super.key});

  @override
  State<CreateStudiPage> createState() => _CreateStudiPageState();
}

class _CreateStudiPageState extends State<CreateStudiPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _hochschuleController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _hochschuleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 24,
            children: [
              Text('Erstelle einen Studierenden'),

              TextField(
                controller: _nameController,
                decoration: InputDecoration(border: OutlineInputBorder(), hint: Text('Name')),
              ),

              TextField(
                controller: _hochschuleController,
                decoration: InputDecoration(border: OutlineInputBorder(), hint: Text('Hochschule')),
              ),

              TextButton(
                onPressed: () {
                  June.getState(() => StudentVM()).addStudi(Student(name: _nameController.text, hochschule: _hochschuleController.text));
                },
                child: Text('Add Studi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
