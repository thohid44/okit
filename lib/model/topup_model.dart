import 'package:json_annotation/json_annotation.dart';
part 'topup_model.g.dart';

@JsonSerializable()
class TopUpModel {
  TopUpModel({
    this.operatorId,
    this.amount,
    this.useLocalAmount,
    this.customIdentifier,
    this.recipientPhone,
    this.access_token,
  });

  String? operatorId;
  int? amount;
  bool? useLocalAmount;
  String? customIdentifier;
  RecipientPhone? recipientPhone;
  String? access_token;

  factory TopUpModel.fromJson(Map<String, dynamic> json) =>
      _$TopUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopUpModelToJson(this);
}

@JsonSerializable()
class RecipientPhone {
  RecipientPhone({
    this.countryCode,
    this.number,
  });

  String? countryCode;
  String? number;

  factory RecipientPhone.fromJson(Map<String, dynamic> json) =>
      _$RecipientPhoneFromJson(json);

  Map<String, dynamic> toJson() => _$RecipientPhoneToJson(this);
}
