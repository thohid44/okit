import 'package:json_annotation/json_annotation.dart';
part 'loginModel.g.dart';

@JsonSerializable()
class LoginModel {
  LoginModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.user,
    this.authToken,
  });

  User? user;
  @JsonKey(name: 'auth_token')
  String? authToken;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class User {
  User({
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  String? name;
  String? email;
  String? phone;
  String? gender;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
