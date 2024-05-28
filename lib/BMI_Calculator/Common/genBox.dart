// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/CalculatorGenProvider.dart';

class container_widget extends StatefulWidget {
  const container_widget({
    super.key,
    required this.text,
    // required this.size,
  });

  final String? text;

  @override
  State<container_widget> createState() => _container_widgetState();
}

class _container_widgetState extends State<container_widget> {
  bool isMobileHorizontal(BuildContext context) =>
      MediaQuery.of(context).size.width <= 393;
  bool isMobileVertical(BuildContext context) =>
      MediaQuery.of(context).size.width <= 804;
  bool isMobilehHorizontal(BuildContext context) =>
      MediaQuery.of(context).size.height <= 393;
  bool isTabWVertical(BuildContext context) =>
      MediaQuery.of(context).size.width <= 804;
  bool isTabHVertical(BuildContext context) =>
      MediaQuery.of(context).size.height <= 1281;

  // final Size size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    double? mHeight;
    double? mWeight;
    double? fontSize;
    double? iconSize;
    double? padding;
    if (isMobileHorizontal(context)) {
      mHeight = size.height / 5.15;
      mWeight = size.width / 2.55;
      fontSize = 22;
      iconSize = 25;
      padding = 0.0;
    } else if (isMobileVertical(context) && isMobilehHorizontal(context)) {
      mHeight = size.height / 2.55;
      fontSize = 22;
      iconSize = 25;
      padding = 0.0;
    } else {
      fontSize = 35;
      iconSize = 35;
      padding = 8.0;
      mWeight = size.width / 3;
      mHeight = 300;
    }
    // ignore: unused_local_variable, non_constant_identifier_names
    final GenderProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    // int selectedGender = 0;
    // var size = MediaQuery.of(context).size;
    // if (widget.text == 'Gender') {}
    return Container(
      alignment: Alignment.center,
      width: mWeight,
      // height: size.height / 1.5,
      height: mHeight,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.all(Radius.circular(35)),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text!,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    GenderProvider.leftClick();
                  },
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.grey[400],
                  ),
                  iconSize: iconSize,
                ),
                Consumer<CalculatorProvider>(builder: (context, value, child) {
                  return value.gen();
                }),
                IconButton(
                  onPressed: () {
                    GenderProvider.rightClick();
                  },
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.grey[400],
                  ),
                  iconSize: iconSize,
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
            Consumer<CalculatorProvider>(
              builder: (context, value, child) {
                return Text(
                  value.gender,
                  style: TextStyle(
                    color: Colors.red[400]!,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
