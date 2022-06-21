import 'package:flutter/material.dart';

import '../../res/size_calculator.dart';

class TileTile extends StatelessWidget {
  final String title;
  const TileTile({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(title)]),
        SizedBox(
          height: sizer(true, 10.0, context),
        ),
      ],
      
    );
  }
}