import 'package:flutter/material.dart';
import '../../values/colors.dart';
import 'string_widgets.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final String? hint;
  final Icon icon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function onSaved;
  final Function onValidate;
  const CustomFormField(
      {Key? key,
      this.obscureText = false,
      this.hint,
      required this.icon,
      required this.keyboardType,
      required this.labelText,
      required this.controller,
      required this.onSaved,
      required this.onValidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
            child: Row(
              children: [LabelText(labelText)],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enabled: true,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(color: grayBF),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: grayE5, width: 1),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: grayE5, width: 1),
                    ),
                  ),
                  keyboardType: keyboardType,
                  onSaved: (value) => onSaved(value),
                  validator: (value) => onValidate(value),
                ),
              ),
              icon
            ],
          ),
        ],
      ),
    );
  }
}
