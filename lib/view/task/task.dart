import 'package:flutter/material.dart';
import 'icon_btn.dart';

class Task extends StatefulWidget {
  final String texty;
  final String optionalInfo;
  final IconData icon;

  const Task(
      {required this.texty,
      required this.optionalInfo,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: [
        Icon(Icons.density_small_outlined),
        Text(
          widget.texty,
        ),
        const Align(
          alignment: Alignment.topRight,
          child: IconBtn(
            icon: Icons.edit,
            colr: Colors.black,
          ),
        ),
      ]),
      Text(
        widget.optionalInfo,
      )
    ]);
  }
}
