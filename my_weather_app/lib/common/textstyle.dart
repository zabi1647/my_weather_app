import 'package:flutter/material.dart';

TextStyle style({
  FontWeight? fw,
  Color? color,
  double? sized,
  double? spacing,
}) {
  return TextStyle(
    fontWeight: fw,
    color: color,
    fontSize: sized,
    wordSpacing: spacing,
  );
}
