import 'package:flutter/material.dart';

sizer(bool width, double value, BuildContext context) {
  if (width) {
    return MediaQuery.of(context).size.width * (value / 375);
  } else {
    return MediaQuery.of(context).size.height * (value / 812);
  }
}
