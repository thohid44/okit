// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletsModel _$WalletsModelFromJson(Map<String, dynamic> json) => WalletsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$WalletsModelToJson(WalletsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'currency': instance.currency,
      'amount': instance.amount,
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
