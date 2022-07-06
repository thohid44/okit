import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_credit_card/credit_card_form.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:okit/constant/text.dart';
import 'package:okit/network/header_interceptor.dart';
import 'package:okit/screen/cards_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../routes/router.gr.dart';
import '../shared/layouts/blank_layout.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/string_widgets.dart';
import '../values/colors.dart';
import 'package:http/http.dart' as http;

class VerificationView extends StatefulWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final GlobalKey<FormState> formkeys = GlobalKey<FormState>();
  final currentStep = 0.obs;
  var client = Client();
  final tok =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NjY5ZTNiYi03ODk5LTQwMGQtYWY3Zi1kOGM3YTgzZDMzNDYiLCJqdGkiOiJhZWRkZTZmNDJhNTg2NWQyOGMyMTZiMGRhM2FmZDc2MWFkYmIwY2NiYjY1NTA5ODA2MGI1NTAwNmViNzg0NjM3YjIxMDMzODVmMmZiOGRlYiIsImlhdCI6MTY1NDQ5NjI1Ni41MTE0NjMsIm5iZiI6MTY1NDQ5NjI1Ni41MTE0NjUsImV4cCI6MTY4NjAzMjI1Ni40MzMxNjYsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.SoXBoGQwNKP7cNWpKZ7JiHECL8hXiJaJdVhBuNOkTIhbKw_zUCeDtIOxenx9OgUys-kOg1eKWq-KZhv86ypdWq1muZ7LrxstCDDeOfysMFuTNRACXL-bgXhVOl_9O192_Q5xFC09NZcPejSMoDR1v4kqPRs6PAZduV-aR9PQKAN9X2QCZrPUr2_paCFSJzyKI13QYpyFG6DTkJRpFl0kUNzO0Z_SPnNhAjtH1hki4UbCBExQVkCnO6UBde4dd_yHZ466uiXCTe1CSvFWS3GoUKctVdys3VrsTNhFUcEJOiCbfC_KvlN3_Dg_ZHxhT9FyjUWwebbJYz1_CfH6uMsmLL6niHbPxLIAXzaqNEIBj14EeNR-E-vK_8AlEKMDkdmmIQxtjFRNAKCNrZY9c5fGLr1D0UaHcszDRa38jIplP6sUq7Ou24xZ7xWfgTv-KQpje296zdvsNdelzJjyRKSauX201Ty20q5Oa_U35qVUTzS3FfD2qNZl73wqQm5NXFGT2BRq4kZdlzXC0vLuv7NrAW5dfJJoXBRi1ZbxY_0rM3QXCJwr7VvJ9X__VGYJT60LW00zh_8EStBdVQgGc0Jp90qGPPDjCsVLjKfYuc5dXf-7r6Pq6pGSxnbYRqpjrP6xd6Tu5hFpn3lFUgU0n9HCSX4BGL2M0JBKm2v4Cfz04h0";

  Future oTPToMail() async {
    var response = await http.post(
        Uri.parse(
          "http://192.168.0.252:8000/verification/send-otp",
        ),
        body: tok + kBearer);

    return print(jsonDecode(response.body));
  }

  int nextStep() {
    if (currentStep.value == 2) {
      context.router.push(LoginRoute());
      return 3;
    }
    return currentStep.value++;
  }

  @override
  Widget build(BuildContext context) {
    return BlankLayout(
      includeAppBar: true,
      backgroundColor: white,
      appbar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: AppBarLabelText('Verification'),
        centerTitle: true,
      ),
      body: SizedBox(
        //height: 700.h,
        child: Obx(
          () => Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(primary: secondaryColor),
              canvasColor: transparent,
            ),
            child: Stepper(
              elevation: 0,
              currentStep: currentStep.value,
              type: StepperType.horizontal,
              steps: getSteps(context),
              onStepContinue: nextStep,
              onStepCancel: null,
              controlsBuilder: (context, controlls) {
                return CustomButton(
                  save: controlls.onStepContinue!,
                  buttonText: 'Next',
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps(BuildContext context) => [
        Step(
            state:
                currentStep.value > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep.value >= 0,
            title: Text(''),
            content: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/sms_logo.png',
                        height: 100.h,
                        width: 100.w,
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: VerificationTitleText(
                          'Please Verify Your Phone Number',
                          myTextAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: SubText(
                          'We have sent SMS code on +1 000 000 0000. Enter the code that you see there.',
                          myTextAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Did not get?',
                            style: TextStyle(color: grayC4),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: InkWell(
                              onTap: () {},
                              child: const Text('RESEND',
                                  style: TextStyle(color: yellow0E)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      smsPinSection(context),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            )),
        Step(
            state:
                currentStep.value > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep.value >= 1,
            title: Text(''),
            content: Column(
              children: [
                Image.asset(
                  'assets/images/email_logo.png',
                  height: 100.h,
                  width: 100.w,
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.all(18.h),
                  child: VerificationTitleText(
                    'Please Verify Your Email Address',
                    myTextAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: SubText(
                    'We have sent code on su********6@gmail.com Enter the code that you see there.',
                    myTextAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Did not get?',
                      style: TextStyle(color: grayC4),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: InkWell(
                        onTap: () {
                          oTPToMail();
                        },
                        child: const Text('RESEND',
                            style: TextStyle(color: yellow0E)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                emailPinSection(context),
                SizedBox(height: 20.h),
              ],
            )),
        Step(
          state: currentStep.value > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep.value >= 2,
          title: Text(''),
          content: Column(
            children: [
              Container(
                width: 300.w,
                height: MediaQuery.of(context).size.height * 0.19,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(width: 1.w, color: grayBF)),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/payPal-logo.png',
                          height: 18,
                        ),
                        title: Text(
                          '**** **** **** 3085',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500, fontSize: 12.sp),
                        ),
                        trailing: Container(
                          height: 30.h,
                          width: 55.w,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Edit',
                              style: GoogleFonts.montserrat(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 300.w,
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(width: 1, color: grayBF)),
                      child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CardsView()));
                          },
                          leading: Image.asset(
                            'assets/images/bank.png',
                            height: 18,
                          ),
                          title: Text(
                            '',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500, fontSize: 12.sp),
                          ),
                          trailing: Container(
                            height: 30.h,
                            width: 55.w,
                            child: ElevatedButton(
                              onPressed: () {
                                addmoney();
                              },
                              child: Text(
                                'Add',
                                style: GoogleFonts.montserrat(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ];

  Padding emailPinSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: PinCodeTextField(
        onChanged: (String value) {},
        length: 4,
        appContext: context,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(15.r),
          fieldHeight: 65.h,
          fieldWidth: 65.w,
          activeFillColor: Colors.white,
          inactiveColor: grayE5,
          selectedColor: yellow0E,
          errorBorderColor: grayE5,
        ),
      ),
    );
  }

  Padding smsPinSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: PinCodeTextField(
        onChanged: (String value) {},
        length: 4,
        appContext: context,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(15),
          fieldHeight: 65.h,
          fieldWidth: 65.w,
          activeFillColor: Colors.white,
          inactiveColor: grayE5,
          selectedColor: yellow0E,
          errorBorderColor: grayE5,
        ),
      ),
    );
  }

  addmoney() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Wrap(children: [
              Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LabelText('Add Card'),
                          Image.asset(
                            'assets/images/masterCard-logo.png',
                            width: 25,
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      // CreditCardForm(
                      //   cardHolderName: '',
                      //   expiryDate: '',
                      //   themeColor: yellowD9,
                      //   cardNumber: '',
                      //   formKey: formkeys,
                      //   cvvCode: '',
                      //   onCreditCardModelChange: (CreditCardModel) {},
                      //   cardNumberDecoration: const InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     labelText: 'Number',
                      //     hintText: 'XXXX XXXX XXXX XXXX',
                      //   ),
                      //   expiryDateDecoration: const InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     labelText: 'Expired Date',
                      //     hintText: 'XX/XX',
                      //   ),
                      //   cvvCodeDecoration: const InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     labelText: 'CVV',
                      //     hintText: 'XXX',
                      //   ),
                      //   cardHolderDecoration: const InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     labelText: 'Card Holder',
                      //   ),
                      // ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          SizedBox(width: 10.w),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: grayBF),
                              onPressed: () {},
                              child: Text('CANCLE'),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: secondaryColor),
                              onPressed: () {},
                              child: Text(
                                'ADD',
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ])

        // buildSheet(),
        );
  }
}
