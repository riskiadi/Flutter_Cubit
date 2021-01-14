import 'package:cubit_app/domain/auth/model/login_request.dart';
import 'package:cubit_app/domain/auth/model/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthRepository{

  Dio _dio = Dio();
  Future signInUser({@required LoginRequest loginRequest}) async{
    Response _response;
    try{
      _response = await _dio.post('https://reqres.in/api/login', data: loginRequest.toJson());
      LoginResponse _loginResponse = LoginResponse.fromJson(_response.data);
      return right(_loginResponse)
    }on Dio catch(e){

    }
    
  }

}