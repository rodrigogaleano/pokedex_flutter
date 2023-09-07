import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  AppFonts._();

  static TextStyle robotoLight(double size, [Color? color]) {
    return GoogleFonts.roboto(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle robotoNormal(double size, [Color? color]) {
    return GoogleFonts.roboto(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle robotoSemiBold(double size, [Color? color]) {
    return GoogleFonts.roboto(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle robotoBold(double size, [Color? color]) {
    return GoogleFonts.roboto(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }
}
