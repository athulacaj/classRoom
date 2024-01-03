import 'package:flutter/foundation.dart';
import 'package:test_app/features/students/model/student_model.dart';

class StudentController extends ChangeNotifier {
  StudentController() {
    fetchStudents();
  }

  final List<StudentModel> students = [
    StudentModel(name: 'John Doe', email: 'john@gmail.com', age: 20),
    StudentModel(name: 'Jane Doe', email: 'janeDoe@gmail.com', age: 21),
  ];
  void fetchStudents() {}
}
