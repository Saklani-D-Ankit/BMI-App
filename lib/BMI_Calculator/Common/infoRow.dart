// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

Row InfoRow(String text1, String text2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(
        width: 50,
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

SizedBox Dividers(Size size) {
  return SizedBox(
    width: size.width / 1.19,
    child: const Divider(
      height: 10,
      endIndent: 137,
    ),
  );
}
