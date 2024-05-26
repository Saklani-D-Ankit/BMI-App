// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Common/height_weight.dart';

class MeasurementProvider with ChangeNotifier {
  final Measurement _measurement = Measurement(height: 150, weight: 50);

  Measurement get measurement => _measurement;

  void updateHeight(int height) {
    _measurement.height = height;
    notifyListeners();
  }

  void updateWeight(int weight) {
    _measurement.weight = weight;
    notifyListeners();
  }
}