import 'package:dio/dio.dart';
import 'package:test_app/config.dart';
import 'package:test_app/features/class_rooms/model/class_room_model.dart';
import 'package:test_app/features/registration/model/registration_model.dart';
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

  Future<Response?> getSubjects() async {
    final response = await apiOperation
        .getOperation("${Config.baseUrl}${ApiEndPoints.subjects}", parameter: {
      'api_key': Config.apiKey,
    });
    return response;
  }

  Future<Response?> getSubjectById(int id) async {
    final response = await apiOperation.getOperation(
        "${Config.baseUrl}${ApiEndPoints.subjects}/$id",
        parameter: {
          'api_key': Config.apiKey,
        });
    return response;
  }

  Future<Response?> getStudentById(int id) async {
    final response = await apiOperation.getOperation(
        "${Config.baseUrl}${ApiEndPoints.students}/$id",
        parameter: {
          'api_key': Config.apiKey,
        });
    return response;
  }

  Future<Response?> getClassrooms() async {
    final response = await apiOperation.getOperation(
        "${Config.baseUrl}${ApiEndPoints.classrooms}",
        parameter: {
          'api_key': Config.apiKey,
        });
    return response;
  }

  Future<Response?> getClassRoomById(int id) async {
    final response = await apiOperation.getOperation(
        "${Config.baseUrl}${ApiEndPoints.classrooms}/$id",
        parameter: {
          'api_key': Config.apiKey,
        });
    return response;
  }

  Future<Response?> updateClassRoom(ClassRoomModel classRoomModel) async {
    final response = await apiOperation.patchUrlEncodedRequest(
        "${Config.baseUrl}${ApiEndPoints.classrooms}/${classRoomModel.id}",
        patchBody: {
          "subject": classRoomModel.subject,
        },
        parameter: {
          'api_key': Config.apiKey,
        });
    return response;
  }

  Future<Response?> getRegistrations() async {
    final response = await apiOperation.getOperation(
        "${Config.baseUrl}${ApiEndPoints.registration}",
        parameter: {
          'api_key': Config.apiKey,
        });
    return response;
  }

  Future<Response?> postRegistrations(
      RegistrationModel registrationModel) async {
    final response = await apiOperation.postUrlEncodedRequest(
        "${Config.baseUrl}${ApiEndPoints.registration}/",
        patchBody: {
          "student": registrationModel.student,
          "subject": registrationModel.subject,
        },
        parameter: {
          'api_key': Config.apiKey,
        });
    return response;
  }
  // Future<Response?> postRegistrations(
  //     RegistrationModel registrationModel) async {
  //   final response = await apiOperation.postOperation(
  //       "${Config.baseUrl}${ApiEndPoints.registration}",
  //       parameter: {
  //         'api_key': Config.apiKey,
  //       },
  //       postBody: {
  //         "registration": {
  //           "id": registrationModel.id,
  //           "student": registrationModel.student,
  //           "subject": registrationModel.subject,
  //         }
  //       });
  //   return response;
  // }

  Future<Response?> deleteRegistrationById(int id) async {
    final response = await apiOperation.deleteOperation(
        "${Config.baseUrl}${ApiEndPoints.registration}/$id",
        parameter: {
          'api_key': Config.apiKey,
        });
    return response;
  }
}
