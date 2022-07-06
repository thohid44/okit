import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIcon extends StatelessWidget {
  String title;
  Icon? icon;
  final onTap;
  bool includeFaIcon;
  FaIcon? faIcon;
  CustomIcon(
      {Key? key,
      required this.title,
      this.icon,
      required this.onTap,
      this.includeFaIcon = false,
      this.faIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      builder: (context) => GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              // padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(child: includeFaIcon ? faIcon : icon),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
