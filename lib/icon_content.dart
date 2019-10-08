import 'package:flutter/material.dart';
import 'Styling.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icoon, @required this.gender});
  final IconData icoon;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icoon, size: 80.0),
        SizedBox(height: 10.0),
        Text(
          gender,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
