import 'dart:convert';

import 'package:dio/dio.dart';

class ApiOperation {
  Future<Response?> patchOperation(
    String baseUrl, {
    Map<dynamic, dynamic>? patchBody,
    Map<String, dynamic>? parameter,
  }) async {
    Response? patchResponse;

    try {
      patchResponse = await NetworkClient.dioInstance.patch(
        baseUrl,
        data: patchBody,
        options: await getDioOptions(),
        queryParameters: parameter,
      );
    } catch (e) {
      patchResponse = await _getErrorResponse(
        e,
        msg:
            'Patch operation error. \nurl: $baseUrl \nbody: ${patchBody?.toString() ?? ''}',
      );
    }

    return patchResponse;
  }

  Future<Response?> getOperation(
    String baseUrl, {
    Map<String, dynamic>? parameter,
  }) async {
    Response? getResponse;

    try {
      getResponse = await NetworkClient.dioInstance.get(
        baseUrl,
        options: await getDioOptions(),
        queryParameters: parameter,
      );
    } catch (e) {
      getResponse = await _getErrorResponse(
        e,
        msg: 'get operation error. url: $baseUrl',
      );
    }

    return getResponse;
  }

  Future<Response?> postOperation(
    String baseUrl, {
    required Map<dynamic, dynamic> postBody,
    Options? options,
    Map<String, dynamic>? parameter,
  }) async {
    Response? postResponse;

    try {
      postResponse = await NetworkClient.dioInstance.post(
        baseUrl,
        data: postBody,
        options: options ?? await getDioOptions(),
        queryParameters: parameter,
      );
    } catch (e) {
      postResponse = await _getErrorResponse(e, msg: 'postOperation failed');
    }

    return postResponse;
  }

  Future<Response?> deleteOperation(
    String baseUrl, {
    Map<String, dynamic>? parameter,
  }) async {
    Response? getResponse;

    try {
      getResponse = await NetworkClient.dioInstance.delete(
        baseUrl,
        options: await getDioOptions(),
        queryParameters: parameter,
      );
    } catch (e) {
      getResponse = await _getErrorResponse(e, msg: 'delete operation failed');
    }

    return getResponse;
  }

  Future<Response?> patchUrlEncodedRequest(String path,
      {required Map patchBody, Map<String, dynamic>? parameter}) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var dio = Dio();
    var data = {'subject': patchBody['subject']};
    var response = await dio.request(
      path,
      options: Options(
        method: 'PATCH',
        headers: headers,
      ),
      queryParameters: parameter ?? {},
      data: data,
    );

    return response;
  }

  Future<Response?> _getErrorResponse(Object e, {required String msg}) async {
    Response? patchResponse;
    if (e is DioException) {
      patchResponse = e.response;
    } else {
      patchResponse = await errorResponse();
    }

    CustomException(e.toString(), message: msg);
    return patchResponse;
  }

  Future<Response> errorResponse() async {
    final Response _errorResponse = Response(
      requestOptions: RequestOptions(),
      statusCode: 400,
    );
    return _errorResponse;
  }
}

class NetworkClient {
  NetworkClient._();

  static final BaseOptions _options = BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 60),
    headers: {},
  );

  static Dio? _dio;

  static Dio get dioInstance {
    _dio ??= Dio(_options);
    return _dio!;
  }
}

Future<Options> getDioOptions() async {
  return Options(
      // add a query parameter to all requests for caching purpose

      );
}

class CustomException implements Exception {
  final String code;
  final String message;

  CustomException(this.code, {required this.message});

  @override
  String toString() {
    return '$code : $message';
  }
}
