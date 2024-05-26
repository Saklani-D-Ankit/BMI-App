import 'package:flutter/material.dart';
import 'package:fst_mobile_app/BMI_Calculator/provider/heightProvider.dart';
import 'package:provider/provider.dart';

class MeasurementScreen extends StatelessWidget {
  const MeasurementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MeasurementProvider>(
        builder: (context, measurementProvider, child) {
          return Column(
            children: [
              Text('Height: ${measurementProvider.measurement.height} cm'),
              ListWheelScrollView(
                itemExtent: 30,
                diameterRatio: 1.5,
                children: List.generate(200, (index) {
                  return Center(
                    child: Text((index + 1).toString()),
                  );
                }),
                onSelectedItemChanged: (index) {
                  measurementProvider.updateHeight(index + 1);
                },
              ),
              Text('Weight: ${measurementProvider.measurement.weight} kg'),
              ListWheelScrollView(
                itemExtent: 30,
                diameterRatio: 1.5,
                children: List.generate(150, (index) {
                  return Center(
                    child: Text((index + 30).toString()),
                  );
                }),
                onSelectedItemChanged: (index) {
                  measurementProvider.updateWeight(index + 30);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
