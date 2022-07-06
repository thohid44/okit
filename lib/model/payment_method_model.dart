import 'package:json_annotation/json_annotation.dart';
part 'payment_method_model.g.dart';

@JsonSerializable()
class PaymentMethodModel {
  PaymentMethodModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.id,
    this.type,
    this.cardNo,
    this.expiryMonth,
    this.expiryYear,
    this.cvc,
  });

  int? id;
  String? type;
  @JsonKey(name: 'card_no')
  String? cardNo;
  @JsonKey(name: 'expiry_month')
  String? expiryMonth;
  @JsonKey(name: 'expiry_year')
  String? expiryYear;
  String? cvc;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
