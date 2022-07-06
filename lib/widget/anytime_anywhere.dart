import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/widgets/string_widgets.dart';
import '../utils/constants.dart';

class AnytimeAnywhere extends StatelessWidget {
  const AnytimeAnywhere({Key? key, required this.next, required this.skip})
      : super(key: key);

  final Function() next;
  final Function() skip;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 7;
    final textScaleFactor = width / mockupWidth;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 380.h,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/on-boarding-bg-one.png'),
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                ),
              ),
              child: Image.asset(
                'assets/images/on-boarding-three.png',
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
                      'Anytime',
                      myTextAlign: TextAlign.start,
                    ),
                    MainTitleText(
                      'Anywhere!',
                      myTextAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: SubText(
                        'Access your money wherever you are anytime via OKIT.',
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
