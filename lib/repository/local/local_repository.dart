import 'dart:convert';


import 'package:android_ios/local/shared_pref_helper.dart';
import 'package:android_ios/network/api/api_constants.dart';
import 'package:android_ios/network/model/authorization.dart';
import 'package:flutter/cupertino.dart';

import '../repository.dart';

class LocalRepository implements Repository {
  final SharedPrefHelper prefHelper;

  LocalRepository({@required this.prefHelper});

  @override
  Future<AuthorizationResult> authorize(
      [String apiKey = ApiConstants.apiKey,
      String language = ApiConstants.language]) async {
    var fromCache = await prefHelper.getAuthToken();
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return AuthorizationResult.fromJson(json);
    }
    return null;
  }


}
