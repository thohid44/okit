import 'package:json_annotation/json_annotation.dart';
part 'countries_model.g.dart';

@JsonSerializable()
class CountriesModel {
  CountriesModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory CountriesModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.bd,
    this.us,
  });

  Bd? bd;
  Bd? us;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Bd {
  Bd({
    this.countryCode,
    this.phoneCode,
  });
  @JsonKey(name: 'country_code')
  String? countryCode;
  @JsonKey(name: 'phone_code')
  String? phoneCode;

  factory Bd.fromJson(Map<String, dynamic> json) => _$BdFromJson(json);

  Map<String, dynamic> toJson() => _$BdToJson(this);
}
