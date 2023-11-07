import 'package:afakyerp/core/api/api_service.dart';
import 'package:afakyerp/core/api/endpoints.dart';
import 'package:afakyerp/features/login/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitStates());
  Future<String> login({required String user, required String pass}) async {
    Map<String, dynamic> data = await ApiService().post(
        body: {"userName": user, "password": pass},
        endpoint: Endpoints.getToken);

    if (data['status'] == 200) {
      emit(LoginSuccessStates());
      print(data["token"]);
      return data["token"].toString();
    } else {
      emit(LoginErrorStates());
      return data["message"].toString();
    }
  }
}
