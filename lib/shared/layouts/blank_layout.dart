import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class BlankLayout extends StatefulWidget {
  final Widget body;
  final Color backgroundColor;
  final bool includeAppBar;
  final AppBar? appbar;
  const BlankLayout(
      {Key? key,
      required this.body,
      this.includeAppBar = false,
      this.appbar,
      this.backgroundColor = primaryColor})
      : super(key: key);

  @override
  _BlankLayoutState createState() => _BlankLayoutState();
}

class _BlankLayoutState extends State<BlankLayout> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: customYellowSwatch,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      child: Scaffold(
        appBar: widget.includeAppBar ? widget.appbar : null,
        backgroundColor: widget.backgroundColor,
        body: widget.body,
      ),
    );
  }
}
