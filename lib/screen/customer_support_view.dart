import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:okit/constant/pref_keys.dart';
import 'package:okit/constant/text.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/shared/layouts/blank_layout.dart';
import 'package:okit/shared/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class CustomerSupportView extends StatefulWidget {
  const CustomerSupportView({Key? key}) : super(key: key);

  @override
  State<CustomerSupportView> createState() => _CustomerSupportViewState();
}

class _CustomerSupportViewState extends State<CustomerSupportView> {
  final _box = GetStorage();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _message = TextEditingController();
  Future customerSupport() async {
    final String token = _box.read(PrefKey.token);
    final apiService = Provider.of<ApiService>(context, listen: false);

    try {
      final response = await apiService.customerSupport({
        'email': _email.text,
        'phone': _phone.text,
        'message': _message.text,
      }, 'Bearer $token');
      if (response.statusCode == 200) {}
    } catch (e) {
      print(e);
    }
  }

  var id = 9;
  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text("Customer Support"), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.0.h),
          child: Form(
            key: _key,
            child: ListView(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w),
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 50.h,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: _phone,
                    decoration: const InputDecoration(
                        border: InputBorder.none, label: Text("Phone")),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _message,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("Message")),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    height: 50.h,
                    width: 200.h,
                    child: ElevatedButton(
                        onPressed: () {
                          customerSupport();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        )))
              ],
            ),
          ),
        ));
  }

  // Future<void> customerSupport(email, phone, message, id) async {
  //   String tok =
  //       "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Njc1YjY5ZC00ODRhLTQ0MWMtODA4MS1jYmU0ZDViNGI3YmMiLCJqdGkiOiI3MGQ1Njg4ZWU0MjJkYTU5ZDQ4ZWVlOTNjOTUwMGU3YTZmNjY5ZGNhOTc1NzllNDMyMjIxMzJkMWNhN2Q3MzJiYjRjNmEyNzEzZjJhZmJjNyIsImlhdCI6MTY1NTI2NTAzNS41OTcxMTUsIm5iZiI6MTY1NTI2NTAzNS41OTcxMTksImV4cCI6MTY4NjgwMTAzNS40Mjk0MzksInN1YiI6IjIiLCJzY29wZXMiOltdfQ.C5IN-R6r3xEY13shUcCkzX9tpv1SmOVSjUXkn7Snbh09MrVXtL0qFf7Vny3fD_Cr4-WGqZhjngkg9B8k1ifTif1S2cTDhJPX3rt24EsF_D1xN9p5In6epWikel5MQjNPGeaMY-ONhNrMqN64ZksORvYQKKsVjr-3yVogoS-y-0ai4fH6MIsMVbOiMBGh6gOf_dqVCjQdjl8uoQNkAu4I0Dy5wPvQL8-w2ymuqOjlrhbnm7QV_J3MMpV1agcdfZN_AuWFFqOrzike4l0hIWrawUAIA2OCvTBUCgch2IcKZyJAMiA_ignm9TZXES_GOPn-NlMbA4yvSmMZy6uYhdX0GERqnzlm7N3ExJFTF3bEhfNACu5QQN3DgXvGvHvL3LUZE3Sp60-VAtS1xzLeHoMjLY5Ebes0XYFSo9wxchaAn8Z0Z7q-38ZVA4jIDhs2Y15h4POthuaQGlZPInL9xx_EzExUdAY7OK5nrUNUYiQSGFUakW07iR3a8sW2oHkBXNzI3UxXiqSdvhNosP2EiMFEeMUuW3ZbK0p1udGz4kYe3-YB9fFnFnxS2hCisOCNZCS-bpwDY8o2IBVt5-Hnz81LQyIxg4nfLyM3WdLmnyuEmJ5ZaS_8ZuClFium3lAlmKO5RS-gx_w0dgJHkJueJsgZTBImlHo382hdmv_7XUvTKbs";
  //   final apiService = Provider.of<ApiService>(context, listen: false);

  //   try {
  //     final response = await apiService.customerSupport(
  //         {'phone': phone, 'email': email, 'message': message, 'user_id': id},
  //         kBearer + tok);
  //     //check response
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       Fluttertoast.showToast(
  //           msg: response.body!.message.toString(),
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.green,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     } else if (response.statusCode == 500) {
  //       Fluttertoast.showToast(
  //           msg: 'Something is wrong!',
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
