import 'package:flutter/foundation.dart';
import 'package:test_app/features/students/model/student_model.dart';
import 'package:test_app/features/students/students_repository.dart';
import 'package:test_app/utils/common/functions/debug_print.dart';

class StudentController extends ChangeNotifier {
  StudentController({required this.studentRepostitory}) {
    fetchStudents();
  }
  final StudentRepostitory studentRepostitory;
  bool isLoading = true;

  final List<StudentModel> students = [];
  Future<void> fetchStudents() async {
    try {
      List<StudentModel> data = await studentRepostitory.getStudents();
      students.addAll(data);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      printIfDebug(e);
    }
  }
}
