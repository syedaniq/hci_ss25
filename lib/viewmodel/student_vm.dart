import 'package:june/june.dart';

import '../models/student.dart';

class StudentVM extends JuneState {
  final studis = [
    Student(name: 'Ben', hochschule: 'h:da'),
    Student(name: 'Tobi', hochschule: 'TU'),
    Student(name: 'Aniq', hochschule: 'h:da'),
  ];

  void addStudi(Student student) {
    studis.add(student);
    setState();
  }
}
