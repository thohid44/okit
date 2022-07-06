import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okit/widget/anytime_anywhere.dart';
import 'package:okit/widget/get_started_login.dart';
import 'package:okit/widget/save_your_money.dart';
import 'package:okit/widget/stepper_widget.dart';
import 'package:okit/widget/transfer_your_money.dart';

import '../../constant/colors.dart';
import '../../routes/router.gr.dart';
import '../../utils/constants.dart';
import '../shared/layouts/blank_layout.dart';
import '../values/colors.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  State<GetStartedView> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedView> {
  int currentStep = 1;
  int stepLength = 3;
  bool complete=false;

  void next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    }
  }

  back() {
    if (currentStep > 1) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScaleFactor = width / mockupWidth;
    return BlankLayout(
      backgroundColor: white,
      includeAppBar: true,
      appbar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: Image.asset('assets/images/logo.png', width: 70, height: 35),
        ),
        leadingWidth: 250,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: currentStep != stepLength
                ? GestureDetector(
              child: const Center(
                child: Text(
                  'SKIP',
                  style: TextStyle(color: yellow0E),
                ),
              ),
              onTap: () {
                onClickDone();
              },
            )
                : const Center(child: Text('')),
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              currentWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  NumberStepper(
                    totalSteps: stepLength,
                    width: 150,
                    curStep: currentStep,
                    stepCompleteColor: Colors.blue,
                    currentStepColor: Color(0xffdbecff),
                    inactiveColor: Color(0xffbababa),
                    lineWidth: 3.5,
                  ),
                  Row(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 35.0),
                        child: currentStep != stepLength
                            ? GestureDetector(
                          child: const Icon(Icons.arrow_forward_outlined),
                          onTap: () {
                            // int nextIndex = controller.selectedPageIndex.value += 1;
                            // controller.nextPage(nextIndex);
                            // pageController.animateToPage(nextIndex,
                            //     curve: Curves.easeInOut,
                            //     duration: const Duration(milliseconds: 400));
                            print('next');
                            onClick();
                          },
                        )
                            : GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.only(top: 60.0),
                            child: Text(
                              'Let’s Start!',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
                            // settingsService.viewed();
                            // Get.offNamed('/login');
                            onClickDone();
                          },
                        ),
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/on-boarding-bg-two.png',
                          ),
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  onClick() {
    next();
  }

  Widget currentWidget() {
    if(currentStep==1){
      return SaveYourMoney(next: onClick, skip: onClickDone,);
    } else if(currentStep==2)
    {
      return TransferYourMoney(next: onClick, skip: onClickDone,);
    }
    else{
     return AnytimeAnywhere(next: onClick, skip: onClickDone,);
   }
  }

  onClickDone() {
    context.router.replace(const LoginRoute());
  }
}
