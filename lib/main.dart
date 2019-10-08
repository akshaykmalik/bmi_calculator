import 'package:flutter/material.dart';
//import 'calculation.dart';
//import 'result.dart';
import 'InputPage.dart';

//Calculation cal = Calculation();
void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xff0A0E21),
      ),
    );
  }
}
/*initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => Result(
            resultValue: cal.getResultValue(),
            resultString: cal.getResultString(),
            comment: cal.getComment()),
      },*/
