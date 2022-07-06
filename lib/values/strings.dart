import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class TextStyles {
  static TextStyle extraBold32 = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );
  static final TextStyle extraBold32White = extraBold32.copyWith(color: white);

  static TextStyle extraBold25 = GoogleFonts.montserrat(
    fontSize: 25,
    fontWeight: FontWeight.w900,
  );
  static final TextStyle extraBold25Black3F =
      extraBold25.copyWith(color: black3F);

  static TextStyle extraBold22 = GoogleFonts.montserrat(
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );
  static final TextStyle extraBold22Black3F =
      extraBold22.copyWith(color: black3F);

  static TextStyle bold20 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle bold20Black3F = bold20.copyWith(color: black3F);

  static TextStyle semiBold12 =
      GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500);
  static final TextStyle semiBold12Black3F =
      semiBold12.copyWith(color: black3F);

  static TextStyle normal12 =
      GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w400);
  static final TextStyle normal12Black3F = normal12.copyWith(color: black3F);

  static TextStyle bold14 =
      GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700);
  static final TextStyle bold14White = bold14.copyWith(color: white);
  static final TextStyle bold14Black3F = bold14.copyWith(color: black3F);

  static TextStyle normal10 =
      GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w400);
  static final TextStyle normal10Black3F = normal10.copyWith(color: black3F);
}
