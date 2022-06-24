import 'package:flutter/material.dart';

class EditButton extends StatefulWidget {
  final String text;

  const EditButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    return Material();
  }
}
