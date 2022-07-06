import 'package:json_annotation/json_annotation.dart';
part 'registration_model.g.dart';

@JsonSerializable()
class RegistrationModel {
  String name;
  String email;
  String password;
  @JsonKey(name: 'terms_and_conditions')
  String terms;
  RegistrationModel({
    required this.name,
    required this.email,
    required this.password,
    required this.terms,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);
}
