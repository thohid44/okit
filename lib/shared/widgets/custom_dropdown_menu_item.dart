import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDownMenuItem extends StatefulWidget {
  List<String> items;
  String value;

  CustomDropDownMenuItem({Key? key, required this.items, required this.value})
      : super(key: key);

  @override
  State<CustomDropDownMenuItem> createState() => _CustomDropDownMenuItemState();
}

class _CustomDropDownMenuItemState extends State<CustomDropDownMenuItem> {
  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<String> buildMenuItem(String item) {
      return DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: GoogleFonts.montaguSlab(
              fontSize: 12, fontWeight: FontWeight.w400),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 52,
      // width: 300,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isExpanded: true,
            iconSize: 25,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            value: widget.value,
            items: widget.items.map(buildMenuItem).toList(),
            onChanged: (value) {
              setState(() {
                print(value);
              });
              value = value;
            }),
      ),
    );
  }
}
