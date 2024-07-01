
import 'package:dio/dio.dart';

class LoginServices{

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://flutter.prominaagency.com/api/',
    ),
  );

  Future<void> userLogin(String email , String password) async {
    try {
      Response response = await dio.post(
        'auth/login',

        data:{
          'email': email,
          'password' : password,
        },
      );

    } catch (e) {
      throw("aaaaaaaa${e}");
    }
  }
}