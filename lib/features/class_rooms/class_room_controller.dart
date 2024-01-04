import 'package:flutter/foundation.dart';
import 'package:test_app/features/class_rooms/class_room_repository.dart';
import 'package:test_app/features/class_rooms/model/class_room_model.dart';

class ClassRoomController with ChangeNotifier {
  ClassRoomController({required this.classRoomRepostitory});
  final ClassRoomRepostitory classRoomRepostitory;
  final List<ClassRoomModel> classRooms = [];
}
