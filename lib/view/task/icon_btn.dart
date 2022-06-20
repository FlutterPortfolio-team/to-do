import 'package:flutter/material.dart';
import 'package:to_do/res/colors/app_colors.dart';

class IconBtn extends StatefulWidget {
  final IconData icon;
  final Color colr;

  const IconBtn({
    Key? key,
    required this.icon,
    required this.colr,
  }) : super(key: key);

  @override
  _IconBtnState createState() => _IconBtnState();
}

class _IconBtnState extends State<IconBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          widget.icon,
          color: widget.colr,
        ),
      ),
    );
  }
}
