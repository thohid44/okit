// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:okit/constant/text.dart';
// import 'package:okit/model/profile_setting_model.dart';
// import 'package:okit/network/api_service.dart';
// import 'package:provider/provider.dart';
// import 'package:okit/network/api_service.dart';

// class SetLimitProvider extends ChangeNotifier {
//   Future<ProfileSettingModel> getRequest() async {
//     ProfileSettingModel? limit;
//     final tok =
//         "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NjY5ZTNiYi03ODk5LTQwMGQtYWY3Zi1kOGM3YTgzZDMzNDYiLCJqdGkiOiJhZWRkZTZmNDJhNTg2NWQyOGMyMTZiMGRhM2FmZDc2MWFkYmIwY2NiYjY1NTA5ODA2MGI1NTAwNmViNzg0NjM3YjIxMDMzODVmMmZiOGRlYiIsImlhdCI6MTY1NDQ5NjI1Ni41MTE0NjMsIm5iZiI6MTY1NDQ5NjI1Ni41MTE0NjUsImV4cCI6MTY4NjAzMjI1Ni40MzMxNjYsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.SoXBoGQwNKP7cNWpKZ7JiHECL8hXiJaJdVhBuNOkTIhbKw_zUCeDtIOxenx9OgUys-kOg1eKWq-KZhv86ypdWq1muZ7LrxstCDDeOfysMFuTNRACXL-bgXhVOl_9O192_Q5xFC09NZcPejSMoDR1v4kqPRs6PAZduV-aR9PQKAN9X2QCZrPUr2_paCFSJzyKI13QYpyFG6DTkJRpFl0kUNzO0Z_SPnNhAjtH1hki4UbCBExQVkCnO6UBde4dd_yHZ466uiXCTe1CSvFWS3GoUKctVdys3VrsTNhFUcEJOiCbfC_KvlN3_Dg_ZHxhT9FyjUWwebbJYz1_CfH6uMsmLL6niHbPxLIAXzaqNEIBj14EeNR-E-vK_8AlEKMDkdmmIQxtjFRNAKCNrZY9c5fGLr1D0UaHcszDRa38jIplP6sUq7Ou24xZ7xWfgTv-KQpje296zdvsNdelzJjyRKSauX201Ty20q5Oa_U35qVUTzS3FfD2qNZl73wqQm5NXFGT2BRq4kZdlzXC0vLuv7NrAW5dfJJoXBRi1ZbxY_0rM3QXCJwr7VvJ9X__VGYJT60LW00zh_8EStBdVQgGc0Jp90qGPPDjCsVLjKfYuc5dXf-7r6Pq6pGSxnbYRqpjrP6xd6Tu5hFpn3lFUgU0n9HCSX4BGL2M0JBKm2v4Cfz04h0";
//     final apiService = Provider.of<ApiService>(context, listen: false);
//     var api = Provider.of<ApiService>();
//     var response = await apiService.getLimitSetting(kBearer + tok);
//     print(response.body);
//     if (response.isSuccessful) {
//       // response.body[0].image!;
//       // course = response.body!;
//       limit = response.body;
//       //

//     }

//     return limit!;
//   }
// }
