// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CalculatorAgeProvider with ChangeNotifier {
  int _age = 18;

  int get age => _age;

  ageUp() {
    _age++;
    notifyListeners();
  }

  ageDown() {
    _age--;
    notifyListeners();
  }

}
