import 'package:json_annotation/json_annotation.dart';
part 'operator_by_country_iso_model.g.dart';

@JsonSerializable()
class OperatorByCountryIos {
  OperatorByCountryIos({
    this.id,
    this.operatorId,
    this.name,
    this.logoUrls,
    this.fixedAmounts,
  });

  int? id;
  int? operatorId;
  String? name;

  List<String>? logoUrls;
  List<double>? fixedAmounts;
}
