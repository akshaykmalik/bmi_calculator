import 'Package:flutter/Material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'Styling.dart';
import 'calculation.dart';
import 'result.dart';

cardType selectedCardType;

enum cardType {
  maleCard,
  femaleCard,
}
int height = 100;
int weight = 80;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    colour: selectedCardType == cardType.maleCard
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: new IconContent(
                        icoon: FontAwesomeIcons.mars, gender: 'MALE'),
                    onPress: () {
                      setState(() {
                        selectedCardType = cardType.maleCard;
                      });
                    }),
              ),
              Expanded(
                child: ReusableCard(
                    colour: selectedCardType == cardType.femaleCard
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: IconContent(
                        icoon: FontAwesomeIcons.venus, gender: 'FEMALE'),
                    onPress: () {
                      setState(() {
                        selectedCardType = cardType.femaleCard;
                      });
                    }),
              ),
            ],
          )),
          Expanded(
              child: ReusableCard(
            colour: kinactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT', style: klabelTextStyle),
                SizedBox(height: 5.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: knumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: klabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.pink,
                    inactiveTrackColor: Colors.greenAccent,
                    thumbColor: Colors.pink,
                    overlayColor: Color(0x29E91E63),
                    //thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 50.0,
                    max: 250.0,
                    onChanged: (double val) {
                      setState(() {
                        height = val.round();
                      });
                    },
                    // activeColor: Colors.pink,
                    //inactiveColor: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                colour: kinactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT', style: klabelTextStyle),
                    Text(weight.toString(), style: knumberTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundButton(
                            rbicon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight = weight + 1;
                              });
                            }),
                        SizedBox(width: 10.0),
                        RoundButton(
                          rbicon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              weight = weight - 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                colour: kinactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE', style: klabelTextStyle),
                    Text(age.toString(), style: knumberTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundButton(
                            rbicon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            }),
                        SizedBox(width: 10.0),
                        RoundButton(
                          rbicon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          )),
        ],
      ),
      floatingActionButton: Theme(
        data: ThemeData(accentColor: Colors.pink),
        child: FloatingActionButton(
          onPressed: () {
            Calculation cal = Calculation(height: height, weight: weight);

            var route = MaterialPageRoute(
              builder: (BuildContext context) => Result(
                  resultValue: cal.getResultValue(),
                  resultString: cal.getResultString(),
                  comment: cal.getComment()),
            );
            Navigator.of(context).push(route);
            // Navigator.pushNamed(context, '/result');
          },
          child: Icon(Icons.arrow_forward),
          //tooltip: 'calculate',
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({this.rbicon, @required this.onPress});
  final Function onPress;
  final IconData rbicon;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      fillColor: Color(0xff4c4F5E),
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      child: Icon(
        rbicon,
        color: Colors.teal,
      ),
      elevation: 10.0,
      shape: CircleBorder(),
    );
  }
}
