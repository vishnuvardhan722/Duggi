import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BconstantColors {
  static const basecolor = Color(0xff0d163f);
  static const txt1color = Color(0xffffffff);
  static const txt2color = Color(0xff0d163f);
  static const tabtxtColor = Color(0xfff1c21a);
  static const buttonbgColor = Color(0xff0d163f);
  static const whitecolor = Color(0xffffffff);
  static const buttonbgColor2 = Color(0xff6d7aff);
  static const buttonbgColor3 = Color(0xff485fc7);
  static const green = Color(0xff008736);
  static const green1 = Color.fromARGB(255, 0, 227, 91);
  static const black = Color(0xff0d0d0d);
  static const grey = Color(0xffd4d4d4);
  static const red = Color(0xffff2828);
}

// text style
final kPopinsBold = GoogleFonts.poppins(
    color: BconstantColors.txt1color, fontWeight: FontWeight.w700);

final kPopinsSemiBold = GoogleFonts.poppins(
    color: BconstantColors.txt1color, fontWeight: FontWeight.w600);

final kPopinsMedium = GoogleFonts.poppins(
    color: BconstantColors.txt1color, fontWeight: FontWeight.w500);

final kPopinsRegular = GoogleFonts.poppins(
    color: BconstantColors.txt1color, fontWeight: FontWeight.w400);
