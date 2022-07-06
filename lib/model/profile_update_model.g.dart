// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileSettingUpdateModel _$ProfileSettingUpdateModelFromJson(
        Map<String, dynamic> json) =>
    ProfileSettingUpdateModel(
      gender: json['gender'] as int?,
      phone: json['phone'] as int?,
      daily_limit: json['daily_limit'] as int?,
      profile_picture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$ProfileSettingUpdateModelToJson(
        ProfileSettingUpdateModel instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'phone': instance.phone,
      'daily_limit': instance.daily_limit,
      'profile_picture': instance.profile_picture,
    };
