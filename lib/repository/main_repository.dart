import 'package:android_ios/network/api/api_constants.dart';
import 'package:android_ios/network/model/authorization.dart';
import 'package:android_ios/repository/remote/api_repository.dart';
import 'package:android_ios/repository/repository.dart';
import 'package:flutter/material.dart';

import 'local/local_repository.dart';

class MainRepository implements Repository {
  final ApiRepository apiRepository;
  final LocalRepository localRepository;

  MainRepository(
      {@required this.apiRepository, @required this.localRepository});

  @override
  Future<AuthorizationResult> authorize(
      [String apiKey = ApiConstants.apiKey,
        String language = ApiConstants.language]) async {
    try {
      var fromLocal =
      await localRepository.authorize(apiKey, language);
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.authorize(apiKey, language);
      //localRepository.saveMovieNowPlaying(data);
      return data;
    }
  }






}
