import 'package:flutter/foundation.dart';
import 'package:test_app/features/class_rooms/class_room_repository.dart';
import 'package:test_app/features/class_rooms/model/class_room_model.dart';
import 'package:test_app/features/subjects/model/subject_model.dart';

class ClassRoomController with ChangeNotifier {
  ClassRoomController({required this.classRoomRepostitory}) {
    fetchClassRooms();
  }
  final ClassRoomRepostitory classRoomRepostitory;
  final List<ClassRoomModel> classRooms = [];
  bool isLoading = true;

  void fetchClassRooms() async {
    final List<ClassRoomModel> classRooms =
        await classRoomRepostitory.getClassrooms();
    this.classRooms.addAll(classRooms);
    isLoading = false;
    notifyListeners();
  }
}
