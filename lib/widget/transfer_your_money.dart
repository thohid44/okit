import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/widgets/string_widgets.dart';
import '../utils/constants.dart';

class TransferYourMoney extends StatelessWidget {
  const TransferYourMoney({Key? key, required this.next, required this.skip})
      : super(key: key);

  final Function() next;
  final Function() skip;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScaleFactor = width / mockupWidth;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 380.h,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/on-boarding-bg-one.png'),
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                ),
              ),
              child: Image.asset(
                'assets/images/on-boarding-two.png',
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
                      'Transfer',
                      myTextAlign: TextAlign.start,
                    ),
                    MainTitleText(
                      'your money',
                      myTextAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: SubText(
                        'Send and Receive money digitally to anyone and from anywhere with our app.',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // imageSection(context),
          // textSection(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // sliderButtonSection(controller),
              Row(children: [
                // arrowSection(context, next())
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
