import 'package:test_app/features/class_rooms/model/class_room_model.dart';
import 'package:test_app/utils/common/api/api_helper.dart';

class ClassRoomRepostitory {
  ClassRoomRepostitory({required this.apiHelper});
  final ApiHelper apiHelper;
  Future<List<ClassRoomModel>> getClassrooms() async {
    final response = await apiHelper.getClassrooms();
    if (response != null && response.statusCode == 200) {
      final List<ClassRoomModel> students =
          ClassRoomModel.fromJsonList(response.data["classrooms"]);
      return students;
    } else {
      throw Exception("Error");
    }
  }

  Future<ClassRoomModel> getClassroomById(int id) async {
    final response = await apiHelper.getClassRoomById(id);
    if (response != null && response.statusCode == 200) {
      final ClassRoomModel classRoom = ClassRoomModel.fromJson(response.data);
      return classRoom;
    } else {
      throw Exception("Error");
    }
  }

  Future<bool> updateSubject(ClassRoomModel classRoomModel) async {
    final response = await apiHelper.updateClassRoom(classRoomModel);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Error");
    }
  }
}
