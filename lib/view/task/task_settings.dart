import 'package:flutter/material.dart';

class TaskStn extends StatefulWidget {
  final IconData icon;
  final String text;
  Color clr = Colors.black;
  TaskStn({required this.icon, required this.text, required this.clr, Key? key})
      : super(key: key);

  @override
  TaskStnState createState() => TaskStnState();
}

class TaskStnState extends State<TaskStn> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
