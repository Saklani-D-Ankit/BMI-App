// ignore_for_file: non_constant_identifier_names, unused_local_variable, file_names, prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:fst_mobile_app/BMI_Calculator/Common/subText.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'Common/infoRow.dart';
import 'provider/CalculatorAgeProvider.dart';
import 'provider/CalculatorGenProvider.dart';
import 'provider/CalculatorHWProvider.dart';

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
  late Widget widgets;

  // ignore: prefer_typing_uninitialized_variables
  var BMI_Value;
  late String BMI_Value_Text;

  final GlobalKey _scrollKey = GlobalKey();
  bool _isOverflowing = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkOverflow();
    });
  }

  void _checkOverflow() {
    final RenderBox renderBox =
        _scrollKey.currentContext?.findRenderObject() as RenderBox;
    final double maxHeight = MediaQuery.of(context).size.height;

    setState(() {
      _isOverflowing = renderBox.size.height > maxHeight;
    });
  }

  late var BMI_Color;
  late int yourAge;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (isTabHorizontal(context)) {
      start = 0;
      end = 5;
      infoStart = 104;
      widths = 620;
      widgets = const SingleChildScrollView();
    } else if (isTabVertical(context)) {
      start = 20;
      end = 22;
      infoStart = 86;
      widths = 200;
      widgets = const Column();
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
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(241),
        ),
        child: Column(
          children: [
            if (_isOverflowing)
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  key: _scrollKey,
                  child: buildContent(context),
                ),
              )
            else
              buildContent(context),
            if (!_isOverflowing) const Spacer(),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      key: _scrollKey,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 10),
          child: HeadingText(
            text: 'RESULT',
            color: Colors.white,
            fontSize: 27,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 260,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(22, 1, 111, 155),
          ),
        ),
        const SizedBox(height: 30),
        Consumer<CalculatorHWProvider>(
          builder: (context, provider, child) {
            var yourWeight = provider.weight;
            var yourheight = (provider.height) / 100;
            BMI_Value = yourWeight / (yourheight * yourheight);
            if (BMI_Value < 18.5) {
              BMI_Value_Text = 'Underweight';
              BMI_Color = const Color.fromARGB(255, 255, 99, 151);
              // Height: 1.75 meters
              // Weight: 55 kilograms
            } else if (BMI_Value < 25) {
              BMI_Value_Text = 'Normal';
              BMI_Color = Colors.green;
              // Height: 1.75 meters
              // Weight: 70 kilograms
            } else if (BMI_Value < 30) {
              BMI_Value_Text = 'Overweight';
              BMI_Color = Colors.orangeAccent;
              // Height: 1.75 meters
              // Weight: 85 kilograms
            } else {
              BMI_Value_Text = 'Obese';
              BMI_Color = const Color.fromARGB(255, 255, 17, 0);
              // Height: 1.75 meters
              // Weight: 100 kilograms
            }
            return HeadingText(
              text: 'Your BMI is: $BMI_Value_Text',
              color: BMI_Color,
              fontSize: 25,
            );
          },
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 154.5,
          height: 40,
          child: HeadingText(
            color: Colors.white,
            text: "Measurements",
            fontSize: 25,
          ),
        ),
        InfoRow(
            'Healthy BMI Range:', '18.5 kg/m2 - 25 kg/m2', infoStart, widths),
        Dividers(size, start, end),
        InfoRow('Healthy Weight for the Height:', '59.9 kg/m2 - 81 kg/m2',
            infoStart, widths),
        Dividers(size, start, end),
        InfoRow('BMI Prime:', '0.8', infoStart, widths),
        Dividers(size, start, end),
        InfoRow('Ponderal Index:', '11.1 kg/m2', infoStart, widths),
        Dividers(size, start, end),
        const Divider(color: Colors.transparent),
        SizedBox(
          width: 167,
          height: 40,
          child: HeadingText(
            color: Colors.white,
            text: "Your RESULT",
            fontSize: 25,
          ),
        ),
        Consumer<CalculatorHWProvider>(
          builder: (context, provider, child) {
            return InfoRow('Your BMI is:', "${BMI_Value.toStringAsFixed(2)}",
                infoStart, widths);
          },
        ),
        Dividers(size, start, end),
        Consumer<CalculatorHWProvider>(
          builder: (context, provider, child) {
            return InfoRow(
                'Your HEIGHT is:', "${provider.height}", infoStart, widths);
          },
        ),
        Dividers(size, start, end),
        Consumer<CalculatorHWProvider>(
          builder: (context, provider, child) {
            return InfoRow(
                'Your WEIGHT is:', "${provider.weight}", infoStart, widths);
          },
        ),
        Dividers(size, start, end),
        Consumer<CalculatorProvider>(
          builder: (context, provider, child) {
            return InfoRow(
                'Your GENDER is:', provider.gender, infoStart, widths);
          },
        ),
        Dividers(size, start, end),
        Consumer<CalculatorAgeProvider>(
          builder: (context, provider, child) {
            yourAge = provider.age;
            return InfoRow(
                'Your AGE is:', "${provider.age}", infoStart, widths);
          },
        ),
        const SizedBox(height: 30),
        const Divider(),
      ],
    );
  }

  Widget buildButtons() {
    return Row(
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
            ),
            onPressed: () {
              Share.share("Your BMI is $BMI_Value at age $yourAge ");
            },
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
    );
  }
}
