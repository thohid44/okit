// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_by_country_iso_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperatorByCountryIos _$OperatorByCountryIosFromJson(
        Map<String, dynamic> json) =>
    OperatorByCountryIos(
      id: json['id'] as int?,
      operatorId: json['operatorId'] as int?,
      name: json['name'] as String?,
      logoUrls: (json['logoUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fixedAmounts: (json['fixedAmounts'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$OperatorByCountryIosToJson(
        OperatorByCountryIos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operatorId': instance.operatorId,
      'name': instance.name,
      'logoUrls': instance.logoUrls,
      'fixedAmounts': instance.fixedAmounts,
    };
