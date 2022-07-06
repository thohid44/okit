import 'package:json_annotation/json_annotation.dart';
part 'customer_support_model.g.dart';

@JsonSerializable()
class CustomerSupportModel {
  CustomerSupportModel({
    this.message,
  });

  String? message;

  factory CustomerSupportModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerSupportModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerSupportModelToJson(this);
}
