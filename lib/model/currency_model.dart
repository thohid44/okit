import 'package:json_annotation/json_annotation.dart';
part 'currency_model.g.dart';

@JsonSerializable()
class SupportedCurrencyModel {
  SupportedCurrencyModel({
    this.data,
    this.message,
  });

  List<Data>? data;
  String? message;

  factory SupportedCurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$SupportedCurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupportedCurrencyModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.id,
    this.name,
    this.code,
    this.symbol,
  });

  int? id;
  String? name;
  String? code;
  String? symbol;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
