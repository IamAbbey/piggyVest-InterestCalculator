import 'package:flutter/material.dart';
import 'ui/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interest Calculator',
      home: CalculatorScreen(),
      // home:Scaffold(
      //         body: SafeArea(
      //           child: Center(
      //             child: Text('Hello World'),
      //           ),
    );
  }
}
