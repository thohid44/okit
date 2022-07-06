import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/widgets/string_widgets.dart';
import '../utils/constants.dart';

class SaveYourMoney extends StatelessWidget {
  const SaveYourMoney({Key? key, required this.next, required this.skip})
      : super(key: key);
  final Function() next;
  final Function() skip;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScaleFactor = width / mockupWidth;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 360.h,
          width: MediaQuery.of(context).size.width,
          child: Container(
            //height: 100.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/on-boarding-bg-one.png'),
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
            child: Image.asset(
              'assets/images/on-boarding-one.png',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTitleText(
                    'Save your ',
                    myTextAlign: TextAlign.start,
                  ),
                  MainTitleText(
                    'money',
                    myTextAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: SubText(
                      'Make your cash secured with our strong technology. We are concerned about your privacy.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // imageSection(context),
        // textSection(context),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     // sliderButtonSection(controller),
        //     Row(children: [
        //       // arrowSection(context, next())
        //     ]),
        //   ],
        // ),
      ],
    );
  }
}
