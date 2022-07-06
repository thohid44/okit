// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singupmessage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpMessage _$SignUpMessageFromJson(Map<String, dynamic> json) =>
    SignUpMessage(
      authToken: json['auth_token'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SignUpMessageToJson(SignUpMessage instance) =>
    <String, dynamic>{
      'auth_token': instance.authToken,
      'message': instance.message,
    };
