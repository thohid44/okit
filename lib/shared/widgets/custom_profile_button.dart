import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProfileInfoButton extends StatelessWidget {
  final onPressed;
  String title;
  String subtitle;
  CustomProfileInfoButton(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Colors.grey.shade100, width: 1))),
      // child: ListTile(title: Text(title), subtitle: Text(subtitle), trailing: IconButton(icon: const Icon(Icons.arrow_forward_ios), onPressed: onPressed),)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  letterSpacing: 1,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                // style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          // Spacer(),
          // SizedBox(width: MediaQuery.of(context).size.width * 0.3,),
          IconButton(
              icon: const Icon(Icons.arrow_forward_ios), onPressed: onPressed)
        ],
      ),
    );
  }
}
