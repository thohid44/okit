import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  ProfileModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.profile_picture,
  });

  String? name;
  String? email;
  dynamic phone;
  dynamic gender;
  String? profile_picture;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
