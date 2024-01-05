import 'package:flutter/foundation.dart';
import 'package:test_app/features/registration/model/registration_model.dart';
import 'package:test_app/features/registration/registration_repository.dart';
import 'package:test_app/features/students/model/student_model.dart';
import 'package:test_app/features/students/students_repository.dart';
import 'package:test_app/features/subjects/model/subject_model.dart';
import 'package:test_app/features/subjects/subject_repository.dart';

class RegistrationController with ChangeNotifier {
  RegistrationController(
      {required this.registrationRepostitory,
      required this.studentRepostitory,
      required this.subjectRepostitory}) {
    init();
  }
  final RegistrationRepostitory registrationRepostitory;
  final StudentRepostitory studentRepostitory;
  final SubjectRepostitory subjectRepostitory;

  final List<RegistrationModel> registrations = [];
  bool isLoading = false;
  StudentModel? selectedStudent;
  SubjectModel? selectedSubject;

  Future<void> init() async {
    isLoading = true;
    notifyListeners();
    registrations.addAll(await registrationRepostitory.getRegistrations());
    isLoading = false;
    notifyListeners();
  }

  Future<(StudentModel, SubjectModel)> getStudentNameAndClassRoom(
      int studentId, int classRoomId) async {
    final student = await studentRepostitory.getSutentById(studentId);
    final subject = await subjectRepostitory.getSubjectById(classRoomId);
    return (student, subject);
  }

  Future<String> getStudentNameFromId(int id) async {
    return (await studentRepostitory.getSutentById(id)).name;
  }

  Future<String> getSubjectNameFromId(int id) async {
    return (await subjectRepostitory.getSubjectById(id)).name;
  }

  bool isRegisterButtonEnabled() {
    return selectedStudent != null && selectedSubject != null;
  }

  void selectStudent(StudentModel studentModel) {
    selectedStudent = studentModel;
    notifyListeners();
  }

  void selectSubject(SubjectModel subjectModel) {
    selectedSubject = subjectModel;
    notifyListeners();
  }

  Future<void> register() async {
    if (isRegisterButtonEnabled()) {
      isLoading = true;
      notifyListeners();
      final toAdd = RegistrationModel(
        id: registrations.length + 1,
        student: selectedStudent!.id,
        subject: selectedSubject!.id,
      );
      RegistrationModel result =
          await registrationRepostitory.postRegistrations(toAdd);
      registrations.add(result);
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> delete(int id) async {
    isLoading = true;
    notifyListeners();
    await registrationRepostitory.deleteRegistrationById(id);
    registrations.removeWhere((element) => element.id == id);
    isLoading = false;
    notifyListeners();
  }
}
