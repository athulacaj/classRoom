import 'package:test_app/features/registration/model/registration_model.dart';
import 'package:test_app/utils/common/api/api_helper.dart';

class RegistrationRepostitory {
  RegistrationRepostitory({required this.apiHelper});
  final ApiHelper apiHelper;

  Future<List<RegistrationModel>> getRegistrations() async {
    final response = await apiHelper.getRegistrations();
    if (response != null && response.statusCode == 200) {
      final List<RegistrationModel> students =
          RegistrationModel.fromJsonList(response.data["registrations"]);
      return students;
    } else {
      throw Exception("Error");
    }
  }

  Future<bool> postRegistrations(RegistrationModel registrationModel) async {
    final response = await apiHelper.postRegistrations(registrationModel);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Error");
    }
  }

  Future<bool> deleteRegistrationById(int id) async {
    final response = await apiHelper.deleteRegistrationById(id);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Error");
    }
  }
}
