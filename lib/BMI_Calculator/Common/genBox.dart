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
  // final Size size;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable, non_constant_identifier_names
    final GenderProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    // int selectedGender = 0;
    var size = MediaQuery.of(context).size;
    // if (widget.text == 'Gender') {}
    return Container(
      alignment: Alignment.center,
      width: size.width / 3,
      // height: size.height / 1.5,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.all(Radius.circular(35)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text!,
              style: const TextStyle(
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
                    GenderProvider.leftClick();
                  },
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.grey[400],
                  ),
                  iconSize: 34,
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
                  iconSize: 34,
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
