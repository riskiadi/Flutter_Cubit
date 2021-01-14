import 'package:cubit2_app/domain/auth/model/login_request.dart';
import 'package:cubit2_app/domain/auth/model/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository{

  Dio _dio = Dio();

  Future<Either<String, LoginResponse>> signInUserWithEmail(LoginRequest loginRequest) async{

    try{
      final response = await _dio.post("https://reqres.in/api/login", data: loginRequest);
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      return right(loginResponse);
    }on DioError catch(e){
      String errorMessage = e.response.data.toString();
      switch(e.type){
        case DioErrorType.CONNECT_TIMEOUT:
          // TODO: Handle this case.
          break;
        case DioErrorType.SEND_TIMEOUT:
          // TODO: Handle this case.
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          // TODO: Handle this case.
          break;
        case DioErrorType.RESPONSE:
          errorMessage = e.response.data['error'];
          break;
        case DioErrorType.CANCEL:
          // TODO: Handle this case.
          break;
        case DioErrorType.DEFAULT:
          // TODO: Handle this case.
          break;
      }
      return left(errorMessage);
    }
    
  }

}