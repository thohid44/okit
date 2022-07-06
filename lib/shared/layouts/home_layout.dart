import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class HomeLayout extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final AppBar? appbar;
  final BottomNavigationBar bottomNavigationBar;
  final Widget? drawer;
  const HomeLayout({
    Key? key,
    required this.body,
    this.appbar,
    this.backgroundColor = primaryColor,
    required this.bottomNavigationBar,
    this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: customYellowSwatch,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      child: Scaffold(
        appBar: appbar,
        backgroundColor: backgroundColor,
        body: body,
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
