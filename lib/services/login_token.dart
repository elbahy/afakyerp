import 'package:afakyerp/models/token_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  late Dio dio;
  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://back.afakyerp.com',
      headers: {'Content-Type': 'application/json'},
    );
    dio = Dio(options);
  }

  Future<TokenModel> loginPost() async {
    Response response = await dio.post('/API/User/Login',
        data: {"userName": "master", "password": "20232023"});
    Map<String, dynamic> data = response.data;
    print(TokenModel.fromJson(data));
    return TokenModel.fromJson(data);
  }
}
