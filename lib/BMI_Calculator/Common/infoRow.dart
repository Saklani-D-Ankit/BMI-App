// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

late int start;
late int end;
late double infoStart;
late double widths;

Row InfoRow(String text1, String text2, double infoStart, double widths) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: infoStart,
      ),
      Expanded(
        child: Text(
          text1,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
      SizedBox(
        width: widths, // Replace 'widths' with a valid constant value
      ),
      Expanded(
        child: Text(
          text2,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ),
    ],
  );
}

SizedBox Dividers(Size size, double start, double end) {
  return SizedBox(
    width: size.width / 1.19,
    child: Divider(
      height: 10,
      indent: start,
      endIndent: end,
    ),
  );
}
