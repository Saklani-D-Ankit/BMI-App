// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fst_mobile_app/BMI_Calculator/Result.dart';
import 'package:fst_mobile_app/BMI_Calculator/provider/CalculatorAgeProvider.dart';
import 'package:fst_mobile_app/ControllerPages/controller/controller.dart';
import 'package:fst_mobile_app/quizApp/quizHome.dart';
import 'package:fst_mobile_app/quizApp/timer.dart';
import 'package:provider/provider.dart';
import 'BMI_Calculator/Calculator.dart';
import 'BMI_Calculator/provider/CalculatorGenProvider.dart';
import 'ControllerPages/pages/homePage.dart';
import 'ControllerPages/pages/splash.dart';
import 'temp/demo.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<CalculatorProvider>(create: (_) => CalculatorProvider()), Not a right way to do it
        // Provider<CalculatorAgeProvider>(create: (_) => CalculatorAgeProvider()),
        ChangeNotifierProvider(create: (context) => CalculatorProvider()),
        ChangeNotifierProvider(create: (context) => CalculatorAgeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MyHomePage(),
        // home: const SplashScreen(),
        // home: const QuizHomePage(),
        // home: const TimerPage(),
        home: const BMICalculatorPage(),
        // home: const EventPage(),
        // home: const ResultPage(),
      ),
    );
  }
}
