import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  // var onTap;
  String title;
  String labelText;
  TextInputType textInputType;
  TextEditingController textEditingController;
  CustomTextField(
      {Key? key,
      required this.title,
      required this.labelText,
      required this.textEditingController,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = labelText;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.montaguSlab(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 7),
          height: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300),
          child: TextField(
            controller: textEditingController,
            keyboardType: textInputType,
            decoration: const InputDecoration(
                prefixText: "     ", border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
