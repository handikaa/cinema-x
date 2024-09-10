import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColor {
// Primary
  static const Color darkBackground = Color(0xFF1F1D2B);
  static const Color soft = Color(0xFF252836);
  static const Color blueAccent = Color(0xFF12CDD9);

// Secondary
  static const Color green = Color(0xFF22B07D);
  static const Color orange = Color(0xFFFF8700);
  static const Color red = Color(0xFFFF7256);

// Text Color
  static const Color black = Color(0xFF171725);
  static const Color darkGrey = Color(0xFF696974);
  static const Color grey = Color(0xFF92929D);
  static const Color whiteGrey = Color(0xFFF1F1F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lineDark = Color(0xFFEAEAEA);
}

class StyleText {
  TextStyle semiBoldText28 =
      GoogleFonts.montserrat(fontSize: 28, fontWeight: semibold);
  TextStyle semiBoldText24 =
      GoogleFonts.montserrat(fontSize: 24, fontWeight: semibold);
  TextStyle semiBoldText18 =
      GoogleFonts.montserrat(fontSize: 18, fontWeight: semibold);
  TextStyle semiBoldText16 =
      GoogleFonts.montserrat(fontSize: 16, fontWeight: semibold);
  TextStyle semiBoldText14 =
      GoogleFonts.montserrat(fontSize: 14, fontWeight: semibold);
  TextStyle semiBoldText12 =
      GoogleFonts.montserrat(fontSize: 12, fontWeight: semibold);
  TextStyle semiBoldText10 =
      GoogleFonts.montserrat(fontSize: 10, fontWeight: semibold);

  TextStyle mediumText28 =
      GoogleFonts.montserrat(fontSize: 28, fontWeight: medium);
  TextStyle mediumText24 =
      GoogleFonts.montserrat(fontSize: 24, fontWeight: medium);
  TextStyle mediumText18 =
      GoogleFonts.montserrat(fontSize: 18, fontWeight: medium);
  TextStyle mediumText16 =
      GoogleFonts.montserrat(fontSize: 16, fontWeight: medium);
  TextStyle mediumText14 =
      GoogleFonts.montserrat(fontSize: 14, fontWeight: medium);
  TextStyle mediumText12 =
      GoogleFonts.montserrat(fontSize: 12, fontWeight: medium);
  TextStyle mediumText10 =
      GoogleFonts.montserrat(fontSize: 10, fontWeight: medium);

  TextStyle regularText28 =
      GoogleFonts.montserrat(fontSize: 28, fontWeight: regular);
  TextStyle regularText24 =
      GoogleFonts.montserrat(fontSize: 24, fontWeight: regular);
  TextStyle regularText18 =
      GoogleFonts.montserrat(fontSize: 18, fontWeight: regular);
  TextStyle regularText16 =
      GoogleFonts.montserrat(fontSize: 16, fontWeight: regular);
  TextStyle regularText14 =
      GoogleFonts.montserrat(fontSize: 14, fontWeight: regular);
  TextStyle regularText12 =
      GoogleFonts.montserrat(fontSize: 12, fontWeight: regular);
  TextStyle regularText10 =
      GoogleFonts.montserrat(fontSize: 10, fontWeight: regular);
}

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
