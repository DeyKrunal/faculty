// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextConst extends StatelessWidget {
  String? text;
  double? fontSize;
  Color? color;
  String? fontFamily;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  double? letterSpacing;
  TextOverflow? textOverflow;
  double? maxLines;
  TextConst({super.key, required this.text,this.maxLines,required this.fontSize,required this.color,required this.fontWeight,required this.fontFamily,this.textAlign,this.letterSpacing,this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      textAlign: textAlign,
      text!,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
