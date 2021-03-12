import 'package:android_ios/network/api/api_constants.dart';
import 'package:android_ios/network/model/authorization.dart';

abstract class Repository {

  Future<AuthorizationResult> authorize(
      [String apiKey = ApiConstants.apiKey,
        String language = ApiConstants.language]
      );


}
