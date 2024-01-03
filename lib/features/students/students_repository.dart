import 'package:test_app/features/students/model/student_model.dart';
import 'package:test_app/utils/common/api/api_helper.dart';

class StudentRepostitory {
  StudentRepostitory({required this.apiHelper});
  final ApiHelper apiHelper;
  Future<List<StudentModel>> getStudents() async {
    final response = await apiHelper.getStudents();
    if (response != null && response.statusCode == 200) {
      final List<StudentModel> students =
          StudentModel.fromJsonList(response.data["students"]);
      return students;
    } else {
      throw Exception("Error");
    }
  }
}
