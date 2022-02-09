import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final Function()? onTap;

  ReusableCard({
    Key? key,
    this.color = kInactiveCardColour,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
