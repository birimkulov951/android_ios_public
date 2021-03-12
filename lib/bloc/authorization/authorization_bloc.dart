import 'package:android_ios/repository/repository.dart';
import 'package:android_ios/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authorization_event.dart';
import 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final Repository repository;

  AuthorizationBloc({this.repository}) : super(InitialAuthorization());

  @override
  Stream<AuthorizationState> mapEventToState(AuthorizationEvent event) async* {
    if (event is LoadAuthorization) {
        yield* _mapLoadMovieTrailerToState(event.movieId);
    }
  }

  Stream<AuthorizationState> _mapLoadMovieTrailerToState(int movieId) async* {
    try {
      yield AuthorizationLoading();
      var albums = await repository.authorize();
      if (albums.props.isEmpty) {
        yield AuthorizationNoData(AppConstants.noData);
      } else {
        yield AuthorizationHasData(albums);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield AuthorizationNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield AuthorizationNoInternetConnection();
      } else {
        yield AuthorizationError(e.toString());
      }
    }
  }


}
