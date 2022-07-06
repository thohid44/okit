import 'package:json_annotation/json_annotation.dart';
part 'faq_model.g.dart';

@JsonSerializable()
class FaqModel {
  FaqModel({
    this.data,
    this.message,
  });

  List<Data>? data;
  String? message;
  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.id,
    this.title,
    this.description,
  });

  int? id;
  String? title;
  String? description;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
