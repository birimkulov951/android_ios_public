import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authorization.g.dart';

@JsonSerializable()
class AuthorizationResult extends Equatable {
  @JsonKey(name: 'albums')
  final List<Authorization> results;

  const AuthorizationResult([this.results = const []]);

  @override
  List<Object> get props => [results];

  factory AuthorizationResult.fromJson(Map<String, dynamic> json) => _$AuthorizationResultFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationResultToJson(this);
}

@JsonSerializable()
class Authorization extends Equatable {

  @JsonKey(name: 'userId')
  final int userId;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;


  Authorization(
      this.userId,
      this.id,
      this.title,
      );

  @override
  List<Object> get props => [
    userId,
    id,
    title
  ];

  factory Authorization.fromJson(Map<String, dynamic> json) => _$AuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);
}
