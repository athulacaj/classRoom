import 'package:test_app/features/subjects/model/subject_model.dart';
import 'package:test_app/utils/common/api/api_helper.dart';

class SubjectRepostitory {
  SubjectRepostitory({required this.apiHelper});
  final ApiHelper apiHelper;
  Future<List<SubjectModel>> getSubjects() async {
    final response = await apiHelper.getSubjects();
    if (response != null && response.statusCode == 200) {
      final List<SubjectModel> students =
          SubjectModel.fromJsonList(response.data["subjects"]);
      return students;
    } else {
      throw Exception("Error");
    }
  }
}
