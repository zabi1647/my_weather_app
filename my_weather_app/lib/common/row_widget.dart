import 'package:flutter/material.dart';
import 'package:my_weather_app/common/sizedbox.dart';
import 'package:my_weather_app/common/textstyle.dart';

Row CustomRow({String? data1, String? data2, double? space}) {
  return Row(
    children: [
      Text(
        data1!,
        style: style(color: Colors.white54, sized: 15),
      ),
      spacing(width: space),
      Text(
        data2!,
        style: style(
          color: Colors.white,
          fw: FontWeight.w400,
          sized: 15,
        ),
      ),
    ],
  );
}
