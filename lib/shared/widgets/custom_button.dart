import 'package:flutter/material.dart';
import '../../values/colors.dart';
import 'string_widgets.dart';

class CustomButton extends StatelessWidget {
  final Function save;
  final String buttonText;
  CustomButton({Key? key, required this.save, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: yellowCD,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2),
              ),
              //you can set more BoxShadow() here
            ],
          ),
          child: Center(child: ButtonText(buttonText)),
        ),
      ),
      onTap: () {
        save();
      },
    );
  }
}
