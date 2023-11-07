import 'package:afakyerp/core/api/endpoints.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(
    baseUrl: Endpoints.baseUrl,
  ));
  Future<dynamic> post(
      {Map<String, dynamic> header = const {'Content-Type': 'application/json'},
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParameters,
      required String endpoint}) async {
    Response response = await dio.post(endpoint,
        data: body,
        options: Options(headers: header),
        queryParameters: queryParameters);
    return response.data;
  }
}
