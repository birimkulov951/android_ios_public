import 'package:android_ios/network/model/authorization.dart';
import 'package:equatable/equatable.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class InitialAuthorization extends AuthorizationState {}

class AuthorizationLoading extends AuthorizationState {}

class AuthorizationHasData extends AuthorizationState {
  final AuthorizationResult authorization;

  const AuthorizationHasData([this.authorization]);

  @override
  List<Object> get props => [authorization];
}

class AuthorizationNoData extends AuthorizationState {
  final String message;

  const AuthorizationNoData(this.message);

  @override
  List<Object> get props => [message];
}

class AuthorizationNoInternetConnection extends AuthorizationState {}

class AuthorizationError extends AuthorizationState {
  final String errorMessage;

  const AuthorizationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
