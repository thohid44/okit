import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSettingsListTile extends StatelessWidget {
  String title;
  String subtitle;
  final onTap;
  // Widget trailing;
  CustomSettingsListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    // this.trailing = const Text(""),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: ListTile(
            title: Text(
              title,
              style: GoogleFonts.montserrat(
                letterSpacing: 1,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: GoogleFonts.montserrat(
                letterSpacing: 1,
                fontSize: 14,
                // fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            trailing: IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Divider(
          indent: 20,
          endIndent: 40,
        ),
      ],
    );
  }
}
