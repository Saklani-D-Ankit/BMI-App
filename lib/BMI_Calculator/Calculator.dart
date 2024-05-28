// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fst_mobile_app/BMI_Calculator/Common/ageBox.dart';
import 'package:fst_mobile_app/BMI_Calculator/Common/subText.dart';
import 'package:fst_mobile_app/BMI_Calculator/Result.dart';

import 'Common/genBox.dart';
import 'Common/height_weight_Box.dart';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final List gen = [
    'Female',
    'Male',
  ];
  @override
  Widget build(BuildContext context) {
    bool isMobileHorizontal(BuildContext context) =>
        MediaQuery.of(context).size.width <= 393;
    bool isMobileVertical(BuildContext context) =>
        MediaQuery.of(context).size.width <= 804;
    // print(isMobileHorizontal(context));
    var size = MediaQuery.of(context).size;
    // print("width ${size.width}");
    late double? textfont;
    late double? subTextFont;
    late double? btnsubTextFont;
    // print("width ${size.width}");
    // print("height ${size.height}");

    if (isMobileHorizontal(context)) {
      // print(size.width);
      textfont = 22;
      subTextFont = 11.5;
      btnsubTextFont = 22;
    } else if (isMobileVertical(context) && size.height > 393) {
      textfont = 22;
      subTextFont = 11.5;
      btnsubTextFont = 22;
    } else if (size.height < 1240 && size.width < 800.5) {
      textfont = 30;
      subTextFont = 17;
      btnsubTextFont = 26;
    } else {
      textfont = 30;
      subTextFont = 17;
      btnsubTextFont = 26;
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(241),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeadingText(
                    text: 'BMI Calculator',
                    color: Colors.white,
                    fontSize: textfont,
                  ),
                  SubText(
                    text: 'Body Mass Index',
                    color: Colors.grey[500],
                    fontSize: subTextFont,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      container_widget(
                        text: 'Gender',
                      ),
                      AgeBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  HeightWeightBox(
                    size: size,
                    text: 'Height',
                    mag1: 'cm',
                    mag2: 'ft',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  HeightWeightBox(
                    size: size,
                    text: 'Weight',
                    mag1: 'kg',
                    mag2: 'lb',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 217, 202, 231),
                            backgroundColor: Colors.deepPurpleAccent,
                            shadowColor: Colors.deepPurple[300],
                            elevation: 10,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResultPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                              fontSize: btnsubTextFont,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
