import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:okit/constant/pref_keys.dart';
import 'package:okit/model/profile_setting_model.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/screen/cards_view.dart';
import 'package:okit/screen/home_view.dart';
import 'package:provider/provider.dart';

import '../routes/router.gr.dart';
import '../shared/layouts/blank_layout.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/custom_text_form_field.dart';
import '../shared/widgets/string_widgets.dart';
import '../values/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // final LoginProvider loginProvider;
  // final SettingsService settingsService;

  // store data in Locally
  final _box = GetStorage();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlankLayout(
      includeAppBar: true,
      appbar: AppBar(
        backgroundColor: transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: Image.asset('assets/images/logo.png', width: 70, height: 35),
        ),
        leadingWidth: 250,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/dummy-user.png',
                      height: 180,
                    ),
                  ],
                ),
                Container(
                  //height: double.infinity,
                  // width: double.infinity,
                  // width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height * .60,
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 30),
                              child: SubTitleText('Login'),
                            ),
                          ],
                        ),
                        CustomFormField(
                          controller: emailTextController,
                          labelText: 'Email',
                          hint: 'Eg: patrickme@gmail.com',
                          icon: const Icon(Icons.email, color: grayE5),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            emailTextController.text = value;
                          },
                          onValidate: validateEmail,
                        ),
                        SizedBox(height: 20.h),
                        CustomFormField(
                          controller: passwordTextController,
                          labelText: 'Password',
                          obscureText: true,
                          hint: '***********',
                          icon:
                              const Icon(Icons.vpn_key_outlined, color: grayE5),
                          keyboardType: TextInputType.text,
                          onSaved: (value) {
                            passwordTextController.text = value;
                          },
                          onValidate: validatePassword,
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          buttonText: 'Login',
                          save: () {
                            bool valid = checkLogin();
                            // context.router.push(HomeRoute());

                            loginUser();
                            //    context.router.push(HomeRoute());
                            // if (valid) {
                            //   login(emailTextController.text,
                            //       passwordTextController.text);
                            // }
                          },
                        ),
                        gotoRegister(context),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget gotoRegister(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don’t have any account?',
            style: TextStyle(color: grayC4),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: InkWell(
              onTap: () {
                context.router.push(const SignUpRoute());
              },
              child:
                  const Text('Create one', style: TextStyle(color: yellow0E)),
            ),
          ),
        ],
      ),
    );
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

  bool checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    log("Form Validated: $isValid");
    if (isValid) {
      loginFormKey.currentState!.save();
      log(emailTextController.text + " " + passwordTextController.text);
      return true;
    }
    Get.snackbar("Error", "Please try again!");
    return false;
  }

  void login(String email, String password) {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    context.router.push(DashboardRoute());
  }

  Future loginUser() async {
    final apiService = Provider.of<ApiService>(context, listen: false);

    try {
      final response = await apiService.loginUser({
        'email': emailTextController.text,
        'password': passwordTextController.text
      });
      if (response.statusCode == 200) {
        var data = response.body;

        _box.write(PrefKey.token, data!.data!.authToken);

        context.router.push(HomeRoute());
      }
    } catch (e) {
      print(e);
    }
  }
}

//eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Njc1YjY5ZC00ODRhLTQ0MWMtODA4MS1jYmU0ZDViNGI3YmMiLCJqdGkiOiJjMDRjMmU2MWJiMGZiMTYwODVmMDJjMTQ2ZGFhYjczMTMxZmM2OTA4ZmFkM2E1MDdlZDM0OGFhZjg0MjZlOTAxODhiMGQyZTExM2NiMDc2ZCIsImlhdCI6MTY1NDMyMzYxNS4wNjQyNTYsIm5iZiI6MTY1NDMyMzYxNS4wNjQyNjIsImV4cCI6MTY4NTg1OTYxNS4wNDc2NDgsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.lENCTBrNz3OEUb8CmrcLbM4mY14GP53etRCuS0WhmoNfrkJady117qpm_F5XnaxzsMLyxjWcUe90uRf0yvfdGaaklUwOB7iKZhQOHi5VyKDFUyqjaivB3L4Gcj3hbZdm3kdRhwwlxpI3ZoBsjF1BJHAUcCVjnhkCl8fzRMwFyl6-oHXkVIMFAWL4npIQZyNlIngfApywp7UOmb742v3uaT25lBQNhVqGokiB7CafBLIz_N_zHLuDfRVLL1tp7kOgv8lrrbSP2FPArMkrgRwd_o3LZ9BhkLSKx5efEotufDDTE62wu3B3qNdbeVh6VDgJqINa9jfKiK6AeD6A8doVJgWDyqp7Tf4KJfkrwzOKqNYcnuH_DXeLrAnJORs5L60vkjfoc22DT_QtFYnJeOOiB7zadWaJ36b1NbCnq409k4ZSCya5za1nCyxyGpkjWin_pO0Ynk-9M1XFaZWGrteTG1damNNAqQtiBYBZUSNytphIu5pgH_VHf6xzKZYZ5aw9gJitKDzg26C--jAqbnl89cLEn329YnM579HJOCbW1gKKyx7AnRawMh5Vexcu-YNtD-FbMlzegYaJV3WXT4nrdJ0s1uRGEgK8mMQz89lhd2X59_Qcg7wkof7R7e20Lfy_Q79NaEvJZ34aonxFf8g4VpEjWZMTJgNGHbml7LIIWk4
