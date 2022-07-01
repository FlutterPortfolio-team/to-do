import 'package:flutter/material.dart';

class BottomBarIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
    final VoidCallback? onPressed;
  const BottomBarIcon({
    Key? key,
    required this.icon,
    required this.text,
    this.color, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: IconButton(
        onPressed: onPressed,
        icon: SizedBox(
          // height: 100,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(
                  icon,
                  color: color ?? Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 12, color: color ?? Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
