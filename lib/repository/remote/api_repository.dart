import 'package:android_ios/network/api/api_constants.dart';
import 'package:android_ios/network/api/api_service.dart';
import 'package:android_ios/network/model/authorization.dart';
import 'package:flutter/cupertino.dart';

import '../repository.dart';

class ApiRepository implements Repository {
  final ApiService apiService;

  ApiRepository({@required this.apiService});

  @override
  Future<AuthorizationResult> authorize(
      [String apiKey = ApiConstants.apiKey,
      String language = ApiConstants.language]) {
    return apiService.authorize(apiKey, language);
  }

}
