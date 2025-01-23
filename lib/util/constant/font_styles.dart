import 'package:advance_currency_converter_app/util/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
 static TextStyle get defTextStyle => GoogleFonts.robotoMono(
    fontSize: 20, fontWeight: FontWeight.bold, color:  AppColors.kPrimary);
 static TextStyle get titleTextStyle => GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF9AA6B2));
 static TextStyle get header1TextStyle => GoogleFonts.aBeeZee(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xFF9AA6B2));
 static TextStyle get buttonTextStyle => GoogleFonts.aBeeZee(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xFF88C273));
  
}
