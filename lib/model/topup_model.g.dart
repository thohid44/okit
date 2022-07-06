// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopUpModel _$TopUpModelFromJson(Map<String, dynamic> json) => TopUpModel(
      operatorId: json['operatorId'] as String?,
      amount: json['amount'] as int?,
      useLocalAmount: json['useLocalAmount'] as bool?,
      customIdentifier: json['customIdentifier'] as String?,
      recipientPhone: json['recipientPhone'] == null
          ? null
          : RecipientPhone.fromJson(
              json['recipientPhone'] as Map<String, dynamic>),
      access_token: json['access_token'] as String?,
    );

Map<String, dynamic> _$TopUpModelToJson(TopUpModel instance) =>
    <String, dynamic>{
      'operatorId': instance.operatorId,
      'amount': instance.amount,
      'useLocalAmount': instance.useLocalAmount,
      'customIdentifier': instance.customIdentifier,
      'recipientPhone': instance.recipientPhone,
      'access_token': instance.access_token,
    };

RecipientPhone _$RecipientPhoneFromJson(Map<String, dynamic> json) =>
    RecipientPhone(
      countryCode: json['countryCode'] as String?,
      number: json['number'] as String?,
    );

Map<String, dynamic> _$RecipientPhoneToJson(RecipientPhone instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'number': instance.number,
    };
