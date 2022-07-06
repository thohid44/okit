import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:okit/screen/verification_view.dart';
import 'package:okit/routes/router.gr.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../shared/layouts/blank_layout.dart';
import '../shared/widgets/custom_button.dart';
import '../values/colors.dart';

class ProfileInfoView extends StatefulWidget {
  const ProfileInfoView({Key? key}) : super(key: key);

  @override
  State<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends State<ProfileInfoView> {
  TextEditingController phoneNumberCtl = TextEditingController();
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
        title: Text('Profile'),
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
                            child: Center(child: Text('\$00')),
                          ),
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 20.r),
                          ),
                          child: Slider(
                              value: 0,
                              min: 0,
                              max: 1000,
                              onChanged: (value) {}),
                        )
                      ],
                    ),
                  ),
                ),
                profilePicture(),
                profilePicturePicker(),
              ],
            ),
            CustomButton(
                save: () {
                  context.router.push(const VerificationRoute());
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
      initialLabelIndex: 0,
      borderColor: [grayE5],
      borderWidth: 1,
      cornerRadius: 20.r,
      activeFgColor: white,
      inactiveBgColor: white,
      inactiveFgColor: grayE5,
      totalSwitches: 2,
      labels: ['Male', 'Female'],
      icons: [Icons.male, Icons.female],
      activeBgColors: [
        [secondaryColor],
        [secondaryColor]
      ],
      onToggle: (index) {
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
            child: Image.network(
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
