import 'package:flutter/material.dart';

abstract class BaseColors {
  //theme color
  Color get shadowColor;
  Color get colorAccent;
  //text color
  Color get colorPrimaryText;
  Color get colorSecondaryText;
  Color get colorRedTex;
  //task and category color
  Color get taskPriorityColor;
  List<Color> get categoryColor;
  List<Color> get categoryIconColor;
  // button color
  Color get buttonGrey;
  Color get buttonBlue;
  //extra color
  Color get blueAppColor;
  Color get colorWhite;
  Color get colorBlack;
  Color get colorRed;
}
