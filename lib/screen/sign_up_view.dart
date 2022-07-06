import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:okit/constant/pref_keys.dart';
import 'package:okit/screen/profile_setting__update.dart';

import 'package:get/get.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/routes/router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../shared/layouts/blank_layout.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/custom_text_form_field.dart';
import '../shared/widgets/string_widgets.dart';
import '../values/colors.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final RxBool checkboxListTileValue = false.obs;

  final _box = GetStorage();

  validateUsername(String username) {
    if (!GetUtils.isUsername(username)) {
      return "Please Provide a valid username";
    }
    return null;
  }

  validateEmail(String email) {
    if (!GetUtils.isEmail(email)) {
      return "Please Provide a valid Email";
    }
    return null;
  }

  validatePassword(String password) {
    if (password.length < 8) {
      return "Password Must be 8 character long";
    }
    return null;
  }

  void checkRegister() async {
    context.router.push(const ProfileInfoRoute());
    final isValid = signUpFormKey.currentState!.validate();
  }

  // void checkBoxRegister(bool toggleChecked) {
  //   checkboxListTileValue.value = toggleChecked;
  // }

  Future signupUser() async {
    final apiService = Provider.of<ApiService>(context, listen: false);

    try {
      final response = await apiService.Signup({
        'name': username.text,
        'email': email.text,
        'password': password.text,
        'terms_and_conditions': 'on'
      });
      var data = response.body;

      _box.write(PrefKey.token, data!.authToken);
      print(data);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PofileSettingUpdate(
                      name: username.text.toString(),
                      email: email.text.toString(),
                    )));
        //   context.router.push(HomeRoute());
      }
      // Navigator.push(context,
      // MaterialPageRoute(builder: (context) => PofileSettingUpdate()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlankLayout(
      includeAppBar: true,
      appbar: AppBar(
        elevation: 0,
        backgroundColor: transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 90.h,
                ),
              ],
            ),
            const SizedBox(height: 55),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Form(
                key: signUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 40, top: 40, bottom: 20),
                          child: SubTitleText('Sign Up'),
                        ),
                      ],
                    ),
                    CustomFormField(
                      controller: username,
                      labelText: 'Username',
                      hint: 'Enter your User Name',
                      icon: const Icon(Icons.person, color: grayE5),
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        username.text = value;
                      },
                      onValidate: validateUsername,
                    ),
                    SizedBox(height: 30.h),
                    CustomFormField(
                      controller: email,
                      labelText: 'Email',
                      hint: 'Eg: patrickme@gmail.com',
                      icon: const Icon(Icons.email, color: grayE5),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        email.text = value;
                      },
                      onValidate: validateEmail,
                    ),
                    SizedBox(height: 30.h),
                    CustomFormField(
                      controller: password,
                      labelText: 'Password',
                      obscureText: true,
                      hint: '***********',
                      icon: const Icon(Icons.vpn_key_outlined, color: grayE5),
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        password.text = value;
                      },
                      onValidate: validatePassword,
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      buttonText: 'Create Account',
                      save: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PofileSettingUpdate()));
                        signupUser();
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
