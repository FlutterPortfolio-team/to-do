import 'package:flutter/material.dart';
import 'package:to_do/view/task/icon_btn.dart';
import 'task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Row(
              children: const [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconBtn(
                    colr: Colors.black,
                    icon: Icons.abc_rounded,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconBtn(
                    colr: Colors.black,
                    icon: Icons.abc_rounded,
                  ),
                ),
              ],
            ),
            const Task(
                texty: 'Do Math Homework',
                optionalInfo: 'Do chapter 2 to for next week',
                icon: Icons.edit),
          ],
        ),
      ),
    );
  }
}
