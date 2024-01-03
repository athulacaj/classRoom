import 'package:dio/dio.dart';
import 'package:test_app/config.dart';
import 'package:test_app/utils/common/api/api_operations.dart';
import 'package:test_app/utils/constants/api_endpoints.dart';

class ApiHelper {
  ApiHelper({required this.apiOperation});
  final ApiOperation apiOperation;

  Future<Response?> getStudents() async {
    final response = await apiOperation
        .getOperation("${Config.baseUrl}${ApiEndPoints.students}", parameter: {
      'api_key': Config.apiKey,
    });
    return response;
  }
}
