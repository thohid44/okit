import 'package:json_annotation/json_annotation.dart';
part 'wallets_model.g.dart';

@JsonSerializable()
class WalletsModel {
  WalletsModel({
    this.data,
    this.message,
  });

  List<Data>? data;
  String? message;

  factory WalletsModel.fromJson(Map<String, dynamic> json) =>
      _$WalletsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletsModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.currency,
    this.amount,
  });

  Currency? currency;
  String? amount;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Currency {
  Currency({
    this.id,
    this.name,
    this.code,
    this.symbol,
  });

  int? id;
  String? name;
  String? code;
  String? symbol;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
