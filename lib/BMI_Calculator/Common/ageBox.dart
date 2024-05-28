// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fst_mobile_app/BMI_Calculator/provider/CalculatorAgeProvider.dart';
import 'package:provider/provider.dart';

class AgeBox extends StatefulWidget {
  const AgeBox({super.key});

  @override
  State<AgeBox> createState() => _AgeBoxState();
}

class _AgeBoxState extends State<AgeBox> {
  // bool isDesktop(BuildContext context) =>
  //     MediaQuery.of(context).size.width > 800;
  // bool isTab(BuildContext context) =>
  //     MediaQuery.of(context).size.width > 392.727;
  bool isMobileHorizontal(BuildContext context) =>
      MediaQuery.of(context).size.width <= 393;
  bool isMobilehHorizontal(BuildContext context) =>
      MediaQuery.of(context).size.height <= 393;
  bool isMobileVertical(BuildContext context) =>
      MediaQuery.of(context).size.width <= 804;
  bool isTabWVertical(BuildContext context) =>
      MediaQuery.of(context).size.width <= 804;
  bool isTabHVertical(BuildContext context) =>
      MediaQuery.of(context).size.height <= 1281;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print("${size.width} ${isTabWVertical(context)}");
    // print("${size.height} ${isTabHVertical(context)}");
    final ageProvider =
        Provider.of<CalculatorAgeProvider>(context, listen: false);
    double? mHeight;
    double? mWeight;
    double? fontSize;
    double? iconSize;
    double? padding;
    if (isMobileHorizontal(context)) {
      // print("This is mobile Horizontal tab");
      mHeight = size.height / 5.15;
      mWeight = size.width / 2.55;
      fontSize = 22;
      iconSize = 25;
      padding = 0.0;
    } else if (isMobileVertical(context) && isMobilehHorizontal(context)) {
      // print("This is mobile Vertical tab");
      mHeight = size.height / 2.55;
      fontSize = 22;
      iconSize = 25;
      padding = 0.0;
    } else {
      // print("This is else tab");
      fontSize = 35;
      iconSize = 35;
      padding = 8.0;
      mWeight = size.width / 3;
      mHeight = 300;
    }
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
              "Age",
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
                    ageProvider.ageDown();
                  },
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.grey[400],
                  ),
                  iconSize: iconSize,
                ),
                Consumer<CalculatorAgeProvider>(
                    builder: (context, value, child) {
                  return Text(
                    value.age.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }),
                IconButton(
                  onPressed: () {
                    ageProvider.ageUp();
                  },
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.grey[400],
                  ),
                  iconSize: iconSize,
                ),
              ],
            ),
            Consumer<CalculatorAgeProvider>(
              builder: (context, value, child) {
                return Text(
                  value.age.toString(),
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
