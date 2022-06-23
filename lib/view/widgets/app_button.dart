import 'package:flutter/material.dart';
import 'package:to_do/res/app_context_extension.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool useSecondColor;
  final VoidCallback? onPressed;
  const AppButton({
    Key? key,
    required this.text,
    required this.useSecondColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: useSecondColor
                    ? context.resources.color.blueAppColor
                    : context.resources.color.buttonBlue),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color: useSecondColor
                    ? Colors.white
                    : context.resources.color.blueAppColor,
              ),
            ),
            // onPressed: () {
            //   // setState(
            //   //   () {
            //   //     _targetDateTime =
            //   //         DateTime(_targetDateTime.year, _targetDateTime.month + 1);
            //   //     _currentMonth = DateFormat.yMMM().format(_targetDateTime);
            //   //   },
            //   // );
            // },
          ),
        ),
      ),
    );
  }
}
