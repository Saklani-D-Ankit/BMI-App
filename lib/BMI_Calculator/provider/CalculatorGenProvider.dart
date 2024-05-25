// ignore_for_file: file_names, unused_element

import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  String _gender = 'Male';

  String get gender => _gender;

  Widget gen() => _gender == 'Male'
      ? const Icon(
          Icons.male,
          size: 50,
          color: Colors.white,
        )
      : const Icon(
          Icons.female,
          size: 50,
          color: Colors.white,
        );

  rightClick() {
    _gender = 'Male';
    notifyListeners();
  }

  leftClick() {
    _gender = 'Female';
    notifyListeners();
  }
}
