import 'package:json_annotation/json_annotation.dart';
part 'profile_update_model.g.dart';

@JsonSerializable()
class ProfileSettingUpdateModel {
  ProfileSettingUpdateModel({
    this.gender,
    this.phone,
    this.daily_limit,
    this.profile_picture,
  });

  int? gender;
  int? phone;
  int? daily_limit;
  String? profile_picture;

  factory ProfileSettingUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileSettingUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileSettingUpdateModelToJson(this);
}
