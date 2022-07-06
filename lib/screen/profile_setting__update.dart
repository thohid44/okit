import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:okit/constant/pref_keys.dart';
import 'package:okit/constant/text.dart';
import 'package:okit/model/profile_update_model.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/screen/login_view.dart';

import '../shared/layouts/blank_layout.dart';
import '../shared/widgets/custom_button.dart';
import '../values/colors.dart';

class PofileSettingUpdate extends StatefulWidget {
  String name;
  String email;
  PofileSettingUpdate({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);
  @override
  State<PofileSettingUpdate> createState() => _PofileSettingUpdateState();
}

class _PofileSettingUpdateState extends State<PofileSettingUpdate> {
  var limit = 1.0;
  TextEditingController phoneNumberCtl = TextEditingController();
  var gender;
  final _box = GetStorage();

  final ImagePicker _picker = ImagePicker();
  var image;
  uploadImage() async {
    final XFile tempImage =
        (await _picker.pickImage(source: ImageSource.gallery))!;

    setState(() {
      image = tempImage.path;
      file = tempImage;
      print(tempImage.name);
      print(image);
    });
  }

  var kBaseUrl = 'https://okit.spinnertechltd.com/api/v1/profile-update';
  XFile? file;

  Future upProfile() async {
    final String token = _box.read(PrefKey.token);
    var url = Uri.parse(kBaseUrl);

    //multipart post
    http.MultipartRequest request = http.MultipartRequest('POST', url);
    request.fields['email'] = widget.email;
    request.fields['name'] = widget.name;
    request.fields['gender'] = gender.toString();
    request.fields['phone'] = phoneNumberCtl.text.toString();
    request.fields['daily_limit'] = limit.toString();

    request.headers.addAll(
      {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    print(file!.path);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath("profile_picture", file!.path);

    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Profile Successfully Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    }
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    PhoneNumber number = PhoneNumber(isoCode: 'US');

    return BlankLayout(
      backgroundColor: Color(0xFFF7F7F7),
      includeAppBar: true,
      appbar: AppBar(
        backgroundColor: Color(0xFFF7F7F7),
        iconTheme: IconThemeData(color: secondaryColor),
        automaticallyImplyLeading: true,
        title: Text('Profile Update'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 80.h,
                    right: 10.w,
                    left: 10.w,
                    bottom: 20.h,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 100.h),
                        maleFemaleSwitch(),
                        SizedBox(height: 20.h),
                        phoneNumberSection(number),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Set Limit',
                              ),
                              Icon(
                                Icons.info_outline,
                                color: Color(0xFFB1B4C4),
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: Container(
                            width: 150.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: grayE5),
                            ),
                            child: Center(child: Text(limit.toString())),
                          ),
                        ),
                        Slider(
                          value: limit,
                          onChanged: (value) {
                            setState(() {
                              limit = value;
                            });
                          },
                          min: 0,
                          max: 1000,
                          activeColor: Colors.yellow,
                          inactiveColor: Colors.green[100],
                          label: limit.round().toString(),
                          divisions: 10,
                        )
                      ],
                    ),
                  ),
                ),
                profilePicture(),
                InkWell(
                  onTap: () {
                    uploadImage();
                  },
                  child: profilePicturePicker(),
                )
              ],
            ),
            CustomButton(
                save: () {
                  upProfile();
                  // context.router.push(VerificationRoute());
                },
                buttonText: 'Finish')
          ],
        ),
      ),
    );
  }

  Padding phoneNumberSection(PhoneNumber number) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: InternationalPhoneNumberInput(
        spaceBetweenSelectorAndTextField: 1,
        onInputChanged: (PhoneNumber number) {
          print(number.phoneNumber);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(color: Colors.black),
        initialValue: number,
        textFieldController: phoneNumberCtl,
        formatInput: false,
        keyboardType: TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        ),
        inputBorder: OutlineInputBorder(),
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
  }

  ToggleSwitch maleFemaleSwitch() {
    return ToggleSwitch(
      minWidth: 110.w,
      minHeight: 50.h,
      initialLabelIndex: 1,
      borderColor: [grayE5],
      borderWidth: 1,
      cornerRadius: 20.r,
      activeFgColor: white,
      inactiveBgColor: Colors.amberAccent,
      inactiveFgColor: grayE5,
      totalSwitches: 2,
      labels: ['Male', 'Female'],
      icons: [Icons.male, Icons.female],
      activeBgColors: [
        [secondaryColor],
        [secondaryColor]
      ],
      onToggle: (index) {
        setState(() {
          gender = index;
        });
        print('switched to: $index');
      },
    );
  }

  Padding profilePicturePicker() {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Align(
        alignment: AlignmentDirectional(0.4, -0.1),
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: Color(0xFFF9CA06),
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align profilePicture() {
    return Align(
      child: Container(
        width: 160.w,
        height: 160.h,
        decoration: const BoxDecoration(
          color: Color(0xFFE9EAF4),
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.01, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(75.r),
            child: image != null
                ? Image.file(
                    File(image.toString()),
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.fitHeight,
                  )
                : Image.network(
                    'https://picsum.photos/seed/103/600',
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
