import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const textStyle19boldBlack = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );
  static const textStyle23boldBlack = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );

  static const textStyle15Grey= TextStyle(
    fontSize: 15,
    color: Color(0xff757575),
    fontWeight: FontWeight.w500,
  );

  static const textStyle14black = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const textStyle13black = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
}

class SFProRounded {
  TextStyle textStyleSFProRounded13 = TextStyle(
    fontSize: 13,
    fontFamily: GoogleFonts.varelaRound().fontFamily,
    fontWeight: FontWeight.w400,
  );
}
