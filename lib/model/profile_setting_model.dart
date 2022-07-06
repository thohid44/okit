import 'package:json_annotation/json_annotation.dart';
part 'profile_setting_model.g.dart';

@JsonSerializable()
class ProfileSettingModel {
  ProfileSettingModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory ProfileSettingModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileSettingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileSettingModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.dailyLimit,
    this.currency,
  });
  @JsonKey(name: 'daily_limit')
  dynamic dailyLimit;
  Currency? currency;

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
