import 'package:bmicalculator/main.dart';
import 'package:bmicalculator/string_app.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderCard extends StatelessWidget {
  final Gender gender;

  GenderCard({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gender == Gender.male
              ? FontAwesomeIcons.mars
              : FontAwesomeIcons.venus,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          gender == Gender.male ? StringApp.maleTitle : StringApp.femaleTitle,
          style: kBodyTextStyle,
        ),
        SizedBox(height: 10,),

      ],
    );
  }
}
