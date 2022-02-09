import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi});

  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBG,
        appBar: AppBar(
          backgroundColor: kBG,
          title: Text(
            'BMI CALCULATOR',
            style: kBodyTextStyle,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "YOUR BMI IS",
                style: kResultTextStyle,
              ),
              Text(
                bmi,
                style: kBMITextStyle,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 80,
                      color: kBottomContainerColour,
                      child: Center(
                          child: Text(
                        'RECALCULATE MY BMI',
                        style: kLargeButtonTextStyle,
                      )),
                    )),
              )
            ],
          ),
        ),);
  }
}
