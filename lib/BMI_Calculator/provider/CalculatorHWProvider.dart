// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CalculatorHWProvider with ChangeNotifier {
  late int _height = 1;
  late int _weight = 1;

  int get height => _height;
  int get weight => _weight;

  void updateHeight(int height) {
    _height = height;
    notifyListeners();
  }

  void updateWeight(int weight) {
    _weight = weight;
    notifyListeners();
  }
}
