import 'package:flutter/material.dart';

import '../../values/strings.dart';

class CardTitleText extends Text {
  final String myData;
  final TextAlign? myTextAlign;
  final Locale? myLocale;
  final bool? mySoftWrap;
  final int? myMaxLines;

  CardTitleText(
    this.myData, {
    Key? key,
    this.myTextAlign,
    this.myLocale,
    this.mySoftWrap,
    this.myMaxLines,
  }) : super(
          myData,
          key: key,
          textAlign: myTextAlign,
          locale: myLocale,
          softWrap: mySoftWrap,
          maxLines: myMaxLines,
          style: TextStyles.extraBold32White,
        );
}

class MainTitleText extends Text {
  final String myData;
  final TextAlign? myTextAlign;
  final Locale? myLocale;
  final bool? mySoftWrap;
  final int? myMaxLines;

  MainTitleText(
    this.myData, {
    Key? key,
    this.myTextAlign,
    this.myLocale,
    this.mySoftWrap,
    this.myMaxLines,
  }) : super(
          myData,
          key: key,
          textAlign: myTextAlign,
          locale: myLocale,
          softWrap: mySoftWrap,
          maxLines: myMaxLines,
          style: TextStyles.extraBold25Black3F,
        );
}

class SubTitleText extends Text {
  final String myData;
  final TextAlign? myTextAlign;
  final Locale? myLocale;
  final bool? mySoftWrap;
  final int? myMaxLines;

  SubTitleText(
    this.myData, {
    Key? key,
    this.myTextAlign,
    this.myLocale,
    this.mySoftWrap,
    this.myMaxLines,
  }) : super(
          myData,
          key: key,
          textAlign: myTextAlign,
          locale: myLocale,
          softWrap: mySoftWrap,
          maxLines: myMaxLines,
          style: TextStyles.extraBold22,
        );
}

class SubText extends Text {
  final String myData;
  final TextAlign? myTextAlign;
  final Locale? myLocale;
  final bool? mySoftWrap;
  final int? myMaxLines;

  SubText(
    this.myData, {
    Key? key,
    this.myTextAlign,
    this.myLocale,
    this.mySoftWrap,
    this.myMaxLines,
  }) : super(
          myData,
          key: key,
          textAlign: myTextAlign,
          locale: myLocale,
          softWrap: mySoftWrap,
          maxLines: myMaxLines,
          style: TextStyles.normal12,
        );
}

class LabelText extends Text {
  final String myData;
  final TextAlign? myTextAlign;
  final Locale? myLocale;
  final bool? mySoftWrap;
  final int? myMaxLines;

  LabelText(
    this.myData, {
    Key? key,
    this.myTextAlign,
    this.myLocale,
    this.mySoftWrap,
    this.myMaxLines,
  }) : super(
          myData,
          key: key,
          textAlign: myTextAlign,
          locale: myLocale,
          softWrap: mySoftWrap,
          maxLines: myMaxLines,
          style: TextStyles.semiBold12Black3F,
        );
}

class AppBarLabelText extends Text {
  final String myData;
  final TextAlign? myTextAlign;
  final Locale? myLocale;
  final bool? mySoftWrap;
  final int? myMaxLines;

  AppBarLabelText(
    this.myData, {
    Key? key,
    this.myTextAlign,
    this.myLocale,
    this.mySoftWrap,
    this.myMaxLines,
  }) : super(
          myData,
          key: key,
          textAlign: myTextAlign,
          locale: myLocale,
          softWrap: mySoftWrap,
          maxLines: myMaxLines,
          style: TextStyles.bold14Black3F,
        );
}

class ButtonText extends Text {
  final String myData;
  final TextAlign? myTextAlign;
  final Locale? myLocale;
  final bool? mySoftWrap;
  final int? myMaxLines;

  ButtonText(
    this.myData, {
    Key? key,
    this.myTextAlign,
    this.myLocale,
    this.mySoftWrap,
    this.myMaxLines,
  }) : super(
          myData,
          key: key,
          textAlign: myTextAlign,
          locale: myLocale,
          softWrap: mySoftWrap,
          maxLines: myMaxLines,
          style: TextStyles.bold14White,
        );
}

class VerificationTitleText extends Text {
  final String myData;
  final TextAlign? myTextAlign;
  final Locale? myLocale;
  final bool? mySoftWrap;
  final int? myMaxLines;

  VerificationTitleText(
    this.myData, {
    Key? key,
    this.myTextAlign,
    this.myLocale,
    this.mySoftWrap,
    this.myMaxLines,
  }) : super(
          myData,
          key: key,
          textAlign: myTextAlign,
          locale: myLocale,
          softWrap: mySoftWrap,
          maxLines: myMaxLines,
          style: TextStyles.bold20Black3F,
        );
}
