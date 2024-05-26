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
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 800;
  bool isTab(BuildContext context) =>
      MediaQuery.of(context).size.width > 392.727;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 392.727;

  @override
  Widget build(BuildContext context) {
    final ageProvider =
        Provider.of<CalculatorAgeProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    double mHeight;
    if (isMobile(context)) {
      mHeight = size.height / 1.5;
    } else {
      mHeight = 300;
    }
    return Container(
      alignment: Alignment.center,
      width: size.width / 3,
      // height: size.height / 1.5,
      height: mHeight,

      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.all(Radius.circular(35)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Age",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w300,
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
                  iconSize: 34,
                ),
                Consumer<CalculatorAgeProvider>(
                    builder: (context, value, child) {
                  return Text(
                    value.age.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
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
                  iconSize: 34,
                ),
              ],
            ),
            Consumer<CalculatorAgeProvider>(
              builder: (context, value, child) {
                return Text(
                  value.age.toString(),
                  style: TextStyle(
                    color: Colors.red[400]!,
                    fontSize: 30,
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
