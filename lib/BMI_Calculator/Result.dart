// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fst_mobile_app/BMI_Calculator/Common/subText.dart';

import 'Common/infoRow.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 800;
  bool isTabVertical(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800.0;
  bool isTabHorizontal(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280.0;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 392.727;
  late double start;
  late double end;
  late double infoStart;
  late double widths;

  var BMI_Value = 'normal';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (isTabHorizontal(context)) {
      start = 0;
      end = 176;
      infoStart = 90;
      widths = 290;
    } else if (isTabVertical(context)) {
      start = 20;
      end = 55;
      infoStart = 70;
      widths = 150;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(241),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 30.0, top: 10),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(241),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadingText(
                text: 'Your Result',
                color: Colors.white,
                fontSize: 27,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 260,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(22, 1, 111, 155),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // Changed from TextAlignVertical(y: 10)
                    width: 150,
                    height: 40,
                    child: Center(
                      child: HeadingText(
                        text: 'Your BMI is ',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    // Changed from TextAlignVertical(y: 10)
                    width: 100,
                    height: 40,
                    child: Center(
                      child: HeadingText(
                        text: 'normal',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              InfoRow('Healthy BMI Range:', '18.5 kg/m2 - 25 kg/m2', infoStart,
                  widths),
              Dividers(size, start, end),
              InfoRow('Healthy Weight for the Height:', '59.9 kg/m2 - 81 kg/m2',
                  infoStart, widths),
              Dividers(size, start, end),
              InfoRow('BMI Prime:', '0.8', infoStart, widths),
              Dividers(size, start, end),
              InfoRow('Ponderal Index:', '11.1 kg/m2', infoStart, widths),
              Dividers(size, start, end),
              const SizedBox(
                height: 30,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white70,
                        backgroundColor: Colors.grey[800],
                        shadowColor: Colors.blueGrey[300],
                        elevation: 20,
                        // shape: const RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(20),
                        //   ),
                        // ),
                      ),
                      onPressed: () {},
                      child: const Text('Share'),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white70,
                        backgroundColor: Colors.deepPurpleAccent,
                        shadowColor: const Color.fromARGB(255, 208, 162, 216),
                        elevation: 20,
                      ),
                      onPressed: () {},
                      child: const Text('Get Details'),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
