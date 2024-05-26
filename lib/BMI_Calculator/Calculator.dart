// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width > 800;
    bool isTab(BuildContext context) =>
        MediaQuery.of(context).size.width > 392.727;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 392.727;
    var size = MediaQuery.of(context).size;
    

    // // for Tab Screen
    // // {
    // Vertical
    // // I/flutter (21825): pad width is : 800.0
    // // I/flutter (21825): pad Height is : 1232.0

    // // Horizontal
    // // I/flutter (21825): pad width is : 1280.0
    // // I/flutter (21825): pad Height is : 752.0
    // // }

    // // for Mobile Screen
    // // {
    // Vertical
    // // I/flutter (19152): pad width is : 392.72727272727275
    // // I/flutter (19152): pad Height is : 803.6363636363636

    // // Horizontal
    // // I/flutter (19152): pad width is : 803.6363636363636
    // // I/flutter (19152): pad Height is : 392.72727272727275
    // // }

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
                    fontSize: 27,
                  ),
                  SubText(
                    text: 'Body Mass Index',
                    color: Colors.grey[500],
                    fontSize: 11.5,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      container_widget(
                        text: 'Gender',
                      ),
                      const AgeBox(),
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
                  // Spacer(),
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
                            // shape: const RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(20),
                            //   ),
                            // ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResultPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Calculate',
                            style: TextStyle(
                              fontSize: 26,
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
