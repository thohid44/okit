import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/colors.dart';
import '../values/colors.dart';

class NumberStepper extends StatelessWidget {
  final double width;
  final totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;
  NumberStepper({
    Key? key,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
  })  : assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0.h,
        bottom: 10.0.h,
        left: 24.0.w,
        right: 24.0.w,
      ),
      width: this.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _steps(),
      ),
    );
  }

  getCircleColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = Colors.white;
    return color;
  }

  getBorderColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = inactiveColor;

    return color;
  }

  getLineColor(i) {
    var color =
    curStep > i + 1 ? Colors.blue.withOpacity(0.4) : Colors.grey[200];
    return color;
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      //colors according to state

      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);

      // step circles
      list.add(
        getStepperElement(i),
      );

      //line between step circles
      if (i != totalSteps - 1) {
        list.add(
          Container(
            width: 12.w,
            height: lineWidth,
            color: Colors.transparent,
          ),
        );
      }
    }

    return list;
  }

  Widget getStepperElement(index) {
    if(index+1<curStep){
      return Container(
        width: 12.w,
        height: 12.h,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: grayE5,
          border: Border.all(color: white),
          shape: BoxShape.circle,
        ),
      );
    } else if(index + 1 == curStep){
      return Container(
        width: 12,
        height: 12,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: white),
          shape: BoxShape.circle,
        ),
      );
    } else{
      return Container(
        width: 12.w,
        height: 12.h,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: grayE5,
          border: Border.all(color: white),
          shape: BoxShape.circle,
        ),
      );
    }

  }
}