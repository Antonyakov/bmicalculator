import 'package:bmicalculator/reusable_card.dart';
import 'package:bmicalculator/string_app.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/result_screen.dart';

import 'gender_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.male;
  var age = 20;
  var height = 150;
  var weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
        backgroundColor: kBG,
        title: Text(
          StringApp.appTitle,
          style: kBodyTextStyle,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  color: gender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: GenderCard(
                    gender: Gender.male,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  color: gender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: GenderCard(
                    gender: Gender.female,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    StringApp.heightTitle,
                    style: kBodyTextStyle,
                  ),
                  Text(
                    height.toString(),
                    style: kNumberTextStyle,
                  ),
                  Slider(
                      min: 130,
                      max: 220,
                      activeColor: kBottomContainerColour,
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          StringApp.weightTitle,
                          style: kBodyTextStyle,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 46.0,
                              ),
                              elevation: 10,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 46.0,
                              ),
                              elevation: 10,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          StringApp.ageTitle,
                          style: kBodyTextStyle,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 46.0,
                              ),
                              elevation: 10,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 46.0,
                              ),
                              elevation: 10,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              final heightSquared = height / 100;
              final res = weight / (heightSquared * heightSquared);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: res.round().toString(),
                  ),
                ),
              );
            },
            child: Container(
              height: 30,
              color: kBottomContainerColour,
              child: Center(
                child: Text(
                  'CALCULATE MY BMI',
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
