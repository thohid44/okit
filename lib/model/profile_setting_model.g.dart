// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileSettingModel _$ProfileSettingModelFromJson(Map<String, dynamic> json) =>
    ProfileSettingModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProfileSettingModelToJson(
        ProfileSettingModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      dailyLimit: json['daily_limit'],
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'daily_limit': instance.dailyLimit,
      'currency': instance.currency,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'symbol': instance.symbol,
    };
