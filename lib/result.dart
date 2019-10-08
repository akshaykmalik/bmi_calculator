import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'Styling.dart';

class Result extends StatelessWidget {
  final String comment;
  final String resultValue;
  final String resultString;

  Result(
      {@required this.resultValue,
      @required this.comment,
      @required this.resultString});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESULT'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: kinactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    resultString,
                    style: TextStyle(color: Colors.teal, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    resultValue,
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    comment,
                    style: klabelTextStyle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: CircleBorder(),
              constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
              child: Icon(Icons.arrow_back),
              elevation: 10.0,
              fillColor: Colors.pink,
            ),
          )
        ],
      ),
    );
  }
}
