import 'package:android_ios/network/model/authorization.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  final Dio dio;

  ApiService({@required this.dio});

  Future<AuthorizationResult> authorize(String apiKey, String language) async {
    try {
      final response = await dio.get("albums",
          queryParameters: {"api_key": apiKey, "language": language});
      return AuthorizationResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }




}
