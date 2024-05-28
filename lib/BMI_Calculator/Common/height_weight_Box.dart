// ignore_for_file: unnecessary_import, file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/CalculatorHWProvider.dart';

// Changed from StatelessWidget to StatefulWidget to manage state
class HeightWeightBox extends StatefulWidget {
  const HeightWeightBox({
    super.key,
    required this.size,
    required this.text,
    required this.mag1,
    required this.mag2,
  });

  final Size size;
  final String? text; // Changed from late String? to final String?
  final String? mag1; // Changed from late String? to final String?
  final String? mag2; // Changed from late String? to final String?

  @override
  _HeightWeightBoxState createState() => _HeightWeightBoxState();
}

class _HeightWeightBoxState extends State<HeightWeightBox> {
  // Added to hold the selected value
  late int? bodyHeightWeight = 1;
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double? mHeight;
    double? mWeight;
    double? fontSize;
    double? iconSize;
    double? padding;
    double? subContainHeight;
    double? subContainWidth;
    double? scrollContainHeight;
    double? scrollContainWidth;
    double? magnification;
    if (isMobileHorizontal(context)) {
      mHeight = widget.size.height / 2.55;
      mWeight = size.width / 1.05;
      fontSize = 22;
      iconSize = 25;
      padding = 0.0;
      subContainHeight = 50;
      subContainWidth = 100;
      scrollContainHeight = 250;
      scrollContainWidth = 120;
      magnification = 1.3;
    } else if (isMobileVertical(context) && isMobilehHorizontal(context)) {
      mHeight = size.height / 1.55;
      mWeight = size.width / 1.55;
      fontSize = 22;
      iconSize = 25;
      padding = 0.0;
      subContainHeight = 50;
      subContainWidth = 150;
      scrollContainHeight = 190;
      scrollContainWidth = 120;
      magnification = 1.3;
    } else {
      fontSize = 35;
      iconSize = 50;
      padding = 10.0;
      mWeight = widget.size.width / 1.32;
      mHeight = 300;
      subContainHeight = 50;
      subContainWidth = 150;
      scrollContainHeight = 250;
      scrollContainWidth = 120;
      magnification = 1.5;
    }
    return Container(
      alignment: Alignment.center,
      width: mWeight,
      // height: widget.size.height / 1.32,
      height: mHeight,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.all(Radius.circular(35)),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.text == 'Height')
                  Icon(
                    Icons.height_rounded,
                    size: iconSize + 10,
                    color: Colors.white,
                  )
                else
                  Icon(
                    Icons.monitor_weight_rounded,
                    size: iconSize + 10,
                    color: Colors.white,
                  ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.text!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: widget.mag1,
                      style: const TextStyle(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        fontSize: 25,
                      ),
                      children: [
                        TextSpan(
                            text: '. ${widget.mag2}',
                            style: TextStyle(color: Colors.grey.shade700))
                      ]),
                ),
              ],
            ),
            Container(
              height: scrollContainHeight,
              width: scrollContainWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Consumer<CalculatorHWProvider>(
                builder: (context, provider, child) {
                  return ListWheelScrollView(
                    diameterRatio: 2.0,
                    itemExtent: 50,
                    // controller: ScrollController(),
                    physics: const FixedExtentScrollPhysics(),
                    useMagnifier: true,
                    magnification: magnification!,
                    onSelectedItemChanged: (value) {
                      // print(widget.text);
                      if (widget.text == 'Height') {
                        provider.updateHeight(value + 1);
                      } else if (widget.text == 'Weight') {
                        provider.updateWeight(value + 1);
                      }
                    },
                    children: List.generate(
                      200,
                      (index) {
                        return Container(
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: widget.text == 'Height'
                                ? Text(
                                    '${index + 1} cm',
                                    style: const TextStyle(fontSize: 17),
                                  )
                                : Text(
                                    '${index + 1} kg',
                                    style: const TextStyle(fontSize: 17),
                                  ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            Container(
              height: subContainHeight,
              width: subContainWidth,
              decoration: BoxDecoration(
                color: const Color.fromARGB(29, 199, 217, 255),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Consumer<CalculatorHWProvider>(
                  builder: (context, provider, child) {
                    if (widget.text == 'Height') {
                      bodyHeightWeight = provider.height;
                    } else {
                      bodyHeightWeight = provider.weight;
                    }
                    return RichText(
                      text: TextSpan(
                        text: '$bodyHeightWeight',
                        style: TextStyle(
                          color: const Color.fromARGB(204, 239, 83, 80),
                          fontSize: fontSize,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: ' ${widget.mag1}',
                            style: const TextStyle(
                              color: Color.fromARGB(197, 184, 98, 98),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )

            // Consumer<CalculatorHWProvider>(
            //   builder: (context, value, child) {
            //     // print(widget.text);
            //     if (widget.text == 'Height') {
            //       bodyHeightWeight = value.height;
            //       // print(widget.text);
            //     } else if (widget.text == "Weight") {
            //       bodyHeightWeight = value.weight;
            //       // print(widget.text);
            //     }
            //     return },
            // ),
          ],
        ),
      ),
    );
  }
}
