import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/// Google fonts constant setting: https://fonts.google.com/
TextTheme kTextTheme(theme, String? language) {
  switch (language) {
    case 'vi':
      return GoogleFonts.ralewayTextTheme(theme);
    case 'ar':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.ralewayTextTheme(theme);
  }
}

TextTheme kHeadlineTheme(theme, [language = 'en']) {
  switch (language) {
    case 'vi':
      return GoogleFonts.ralewayTextTheme(theme);
    case 'ar':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.ralewayTextTheme(theme);
  }
}

const kHeaderTextStyle = TextStyle(
  fontSize: 28.0,
  color: kLightPrimary,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);

const kTitleTextStyle = TextStyle(
  fontSize: 15.0,
  color: kLightPrimary,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);
const kSponDetailsStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kDetailsTxtStyle = TextStyle(
  fontSize: 10.0,
  color: Colors.blueGrey,
);

const kLabelTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const kDefaultPaddin = 20.0;
const List<Color> kPremierColorList = [Color(0XFF026B9A), Color(0XFF3BBCE9)];

Decoration decorationBlueBorder = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20.0),
  border: Border.all(color: kLightAccent, width: 1.0),
);

InputDecoration editTextWithBoarderDecoration(String labelText,
        {double thickness = 1.0}) =>
    InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: kLightAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(width: thickness, color: kLightAccent),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: kLightAccent),
        alignLabelWithHint: false,
        filled: true);

Decoration decorOnlyBlueBoarder = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: kLightAccent, width: 2));

Decoration decorEggsBlueBoarder = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: kLightAccent, width: 2));
