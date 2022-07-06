import 'package:json_annotation/json_annotation.dart';
part 'singupmessage_model.g.dart';

@JsonSerializable()
class SignUpMessage {
  SignUpMessage({
    this.authToken,
    this.message,
  });
  @JsonKey(name: 'auth_token')
  String? authToken;
  String? message;

  factory SignUpMessage.fromJson(Map<String, dynamic> json) =>
      _$SignUpMessageFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpMessageToJson(this);
}
