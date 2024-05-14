import 'package:flutter/material.dart';

class StyleFonts {
  static TextStyle kantumruyPro({
    double? fontSize,
    Color? color,
    bool? bold = false,
  }) {
    return TextStyle(
      fontFamily: "KantumruyPro",
      fontSize: fontSize ?? 16,
      color: color ?? Colors.white,
      fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
    );
  }
}
