import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;

  DioHelper._();

  static inint() {
    _dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveTimeout: const Duration(seconds: 120),
          headers: {"lang": "en", "Content-Type": "application/json"}),
    );
  }

  //-------------------Get-----------------------//

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      data: body,
    );
    return response;
  }

  //-------------------post-----------------------//

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.post(
      path,
      queryParameters: queryParameters,
      data: body,
    );
    return response;
  }

  //-------------------Delete-----------------------//

  static Future<Response> deleteData({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.delete(
      path,
      queryParameters: queryParameters,
      data: body,
    );
    return response;
  }

  //-------------------Patch-----------------------//

  static Future<Response> patchData({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.patch(
      path,
      queryParameters: queryParameters,
      data: body,
    );
    return response;
  }

  //-------------------Put-----------------------//

  static Future<Response> putData({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.put(
      path,
      queryParameters: queryParameters,
      data: body,
    );
    return response;
  }
}
