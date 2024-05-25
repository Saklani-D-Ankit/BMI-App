// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget SubText({
  String? text,
  Color? color,
  double? fontSize,
}) {
  return SizedBox(
    height: 20,
    width: double.infinity,
    child: Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget HeadingText({
  String? text,
  Color? color,
  double? fontSize,
}) {
  return SizedBox(
    height: 48,
    width: double.infinity,
    child: Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
