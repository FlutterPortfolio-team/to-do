import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: 63,
      decoration: BoxDecoration(
          color: const Color(0xFF272727),
          border: Border.all(color: Colors.transparent),
          borderRadius: const BorderRadius.all(Radius.circular(2))),
      child: Center(
        child: body,
      ),
    );
  }
}
