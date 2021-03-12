import 'package:equatable/equatable.dart';

abstract class AuthorizationEvent extends Equatable {
  final int movieId;
  final bool isFromMovie;

  const AuthorizationEvent(this.movieId, this.isFromMovie);

  @override
  List<Object> get props => [movieId];
}

class LoadAuthorization extends AuthorizationEvent {
  LoadAuthorization(int movieId, bool isFromMovie) : super(movieId, isFromMovie);
}
