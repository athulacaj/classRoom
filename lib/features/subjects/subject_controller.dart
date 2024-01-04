import 'package:flutter/material.dart';
import 'package:test_app/features/subjects/model/subject_model.dart';
import 'package:test_app/features/subjects/subject_repository.dart';

class SubJectController with ChangeNotifier {
  SubJectController({required this.subjectRepostitory}) {
    getSubjects();
  }
  final SubjectRepostitory subjectRepostitory;
  final List<SubjectModel> subjects = [];
  bool isLoading = true;
  void getSubjects() async {
    subjects.addAll(await subjectRepostitory.getSubjects());
    isLoading = false;
    notifyListeners();
  }
}
