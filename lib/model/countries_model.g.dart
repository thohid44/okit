// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) =>
    CountriesModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CountriesModelToJson(CountriesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      bd: json['bd'] == null
          ? null
          : Bd.fromJson(json['bd'] as Map<String, dynamic>),
      us: json['us'] == null
          ? null
          : Bd.fromJson(json['us'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'bd': instance.bd,
      'us': instance.us,
    };

Bd _$BdFromJson(Map<String, dynamic> json) => Bd(
      countryCode: json['country_code'] as String?,
      phoneCode: json['phone_code'] as String?,
    );

Map<String, dynamic> _$BdToJson(Bd instance) => <String, dynamic>{
      'country_code': instance.countryCode,
      'phone_code': instance.phoneCode,
    };
