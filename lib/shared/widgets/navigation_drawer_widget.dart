import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okit/routes/router.gr.dart';
import 'package:okit/screen/cards_view.dart';
import 'package:okit/screen/customer_support_view.dart';
import 'package:okit/screen/faq_page_view.dart';
import 'package:okit/screen/login_view.dart';
import 'package:okit/screen/notifications_view.dart';
import 'package:okit/screen/transactions.dart';
import '../../values/colors.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                      onTap: () => Get.back(),
                    ),
                    SizedBox(width: 80),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 30,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'General',
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
            buildMenuItem(
                icon: Icons.signal_cellular_alt_rounded, title: 'Set Limit'),
            buildMenuItem(icon: Icons.lock, title: 'Two Step Authentication'),
            buildMenuItem(
                icon: Icons.check_box_outlined, title: 'Verification Center'),
            buildMenuItem(
                icon: Icons.supervised_user_circle_outlined,
                title: 'Invite Friends'),
            buildSwitchMenuItem(context),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Transactions()));
                },
                child: buildMenuItem(
                    icon: Icons.bar_chart, title: 'Transactions')),
            Padding(
              padding: EdgeInsets.only(left: 18.0.h),
              child: Text('Help'),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FaqPageView()));
                },
                child: buildMenuItem(
                    icon: Icons.question_answer_outlined, title: 'FAQ’s')),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerSupportView()));
                },
                child: buildMenuItem(
                    icon: Icons.support, title: 'Customer Support')),
            buildMenuItem(icon: Icons.my_library_books_sharp, title: 'Report'),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[300],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                      child: Text(
                        'Log out',
                        style: GoogleFonts.montserrat(
                          color: white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({required IconData icon, required String title}) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 31,
        width: 31,
        child: Icon(
          icon,
          color: yellow09,
          size: 15,
        ),
      ),
      title: Text(
        title,
        style:
            GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w500),
      ),
      trailing: Container(
          width: 20,
          height: 20,
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 15,
            color: black3F,
          )),
    );
  }

  Widget buildSwitchMenuItem(context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NotificationView()));
      },
      leading: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 31,
        width: 31,
        child: Icon(
          Icons.notifications_none_outlined,
          color: yellow09,
          size: 15,
        ),
      ),
      title: Text(
        "Notifications",
        style:
            GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w500),
      ),
      trailing: Switch(
          value: true, onChanged: (value) {}, activeColor: secondaryColor),
    );
  }
}
