import 'package:flutter/material.dart';
import 'package:to_do/res/colors/general_color.dart';

import '../../res/size_calculator.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {Key? key,
      this.title,
      this.description,
      this.imageSrc,
      this.dataLength,
      this.currentIndex})
      : super(key: key);
  final String? title, imageSrc, description;
  final int? dataLength;
  final double? currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          imageSrc ?? '',
          fit: BoxFit.contain,
          // height: 220,
          width: currentIndex != 4 ? 220 : 300,
        ),
        SizedBox(
          height: sizer(false, 26, context),
        ),
        Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sizer(true, 35, context),
            color: GenColors.kBlue,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: sizer(false, 32, context),
        ),
        Text(
          description ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sizer(true, 14.0, context),
            color: GenColors.kBlue,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25
          ),
        ),
      ],
    );
  }
}
