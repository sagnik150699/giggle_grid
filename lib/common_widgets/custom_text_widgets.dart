import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrbitronFont extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;

  const OrbitronFont(
      {super.key,
      required this.text,
      required this.fontSize,
      this.fontColor = Colors.white,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.orbitron(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: fontWeight,
        ));
  }
}
