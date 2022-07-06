import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../values/colors.dart';

class LargeAppBarLayout extends StatefulWidget {
  final Widget body;
  final Color backgroundColor;
  final AppBar appbar;
  const LargeAppBarLayout(
      {Key? key,
      required this.body,
      required this.appbar,
      this.backgroundColor = primaryColor})
      : super(key: key);

  @override
  _BlankLayoutState createState() => _BlankLayoutState();
}

class _BlankLayoutState extends State<LargeAppBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: customYellowSwatch,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: widget.appbar,
          backgroundColor: widget.backgroundColor,
          body: widget.body,
        ),
      ),
    );
  }
}
