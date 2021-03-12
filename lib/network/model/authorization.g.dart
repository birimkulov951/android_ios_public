// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationResult _$AuthorizationResultFromJson(Map<String, dynamic> json) {
  return AuthorizationResult(
    (json['albums'] as List)
        ?.map((e) => e == null
            ? null
            : Authorization.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AuthorizationResultToJson(
        AuthorizationResult instance) =>
    <String, dynamic>{
      'albums': instance.results,
    };

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) {
  return Authorization(
    json['userId'] as int,
    json['id'] as int,
    json['title'] as String,
  );
}

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
