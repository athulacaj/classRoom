import 'package:flutter/material.dart';
import 'package:test_app/features/class_rooms/class_room_repository.dart';
import 'package:test_app/features/class_rooms/model/class_room_model.dart';
import 'package:test_app/features/subjects/model/subject_model.dart';
import 'package:test_app/features/subjects/subject_repository.dart';

class ClassRoomDetailedController with ChangeNotifier {
  ClassRoomDetailedController({
    required this.id,
    required this.classRoomRepostitory,
    required this.subjectRepostitory,
  }) {
    fetchClassRoomByIdFromApi();
  }
  final ClassRoomRepostitory classRoomRepostitory;
  final SubjectRepostitory subjectRepostitory;
  final int id;

  bool isSubjectLoading = false;
  SubjectModel? subjectModel;
  ClassRoomModel? classRoomModel;

  void fetchClassRoomByIdFromApi() async {
    final classRoom = await classRoomRepostitory.getClassroomById(id);
    classRoomModel = classRoom;
    if (classRoom.subject != null && classRoom.subject != "") {
      final subject =
          await subjectRepostitory.getSubjectById(classRoom.subject!);
      subjectModel = subject;
    }
    notifyListeners();
  }

  void updateSubject(int subjectId) async {
    isSubjectLoading = true;
    notifyListeners();
    final success = await classRoomRepostitory.updateSubject(
      classRoomModel!.copyWith(subject: subjectId),
    );
    if (success) {
      final subject = await subjectRepostitory.getSubjectById(subjectId);
      subjectModel = subject;
    }
    isSubjectLoading = false;
    notifyListeners();
  }

  void addSubjectToClassRoom(SubjectModel subjectModel) async {
    updateSubject(subjectModel.id);
  }
}
