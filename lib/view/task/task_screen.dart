import 'package:flutter/material.dart';
import 'package:to_do/components/dialogs/button/full_button.dart';
import 'package:to_do/res/size_calculator.dart';
import 'package:to_do/utils/display_dialog.dart';
import 'package:to_do/view/task/edit_task_widget.dart';
import 'package:to_do/view/widgets/calender.dart';
import 'package:to_do/view/widgets/choose_time_widget.dart';

class TaskScreen extends StatefulWidget {
  final String title, description, hour, minute, taskDate;
  final int? taskId;
  const TaskScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.taskDate,
    required this.hour,
    required this.minute,
    this.taskId,
  }) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomListTile(
                    leading: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          color: const Color(0xFF0E2045),
                          child: Image.asset(
                            'assets/Images/cancel.png',
                            color: Colors.white,
                            height: 32,
                            width: 32,
                          )),
                    ),
                    trailing: Container(
                        color: const Color(0xFF0E2045),
                        child: Image.asset(
                          'assets/Images/refresh.png',
                          color: Colors.white,
                          height: 32,
                          width: 32,
                        )),
                  ),
                  const SizedBox(height: 20),
                  CustomListTile(
                    leading: const Text(
                      '\u2022',
                      style: TextStyle(fontSize: 60),
                    ),
                    title: Text(
                      widget.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    trailing: Container(
                      height: 48,
                      width: 48,
                      color: const Color(0xFF0E2045),
                      child: GestureDetector(
                        onTap: () async{
                          await displayDialog(
                              context,
                              EditTaskWidget(
                                taskId: widget.taskId!,
                                description: widget.description,
                                tatskTitle: widget.title,
                              ));
                        },
                        child: const Icon(
                          Icons.edit_sharp,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  CustomListTile(
                    leading: GestureDetector(
                      onTap: () => displayDialog(
                          context,
                          ChooseTimeWidget(
                            onHourValueChanged: (value) => value = widget.hour,
                            onMinutesValueChanged: (value) =>
                                value = widget.minute,
                            onTimeValueChanged: (time) =>
                                debugPrint(time.toString()),
                            onSaved: () {
                              Navigator.pop(context);
                            },
                          )),
                      child: Image.asset(
                        'assets/Images/timer.png',
                        color: Colors.black,
                      ),
                    ),
                    title: const Text(
                      'Task Time',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: textCard('${widget.hour}:${widget.minute}'),
                  ),
                  const SizedBox(height: 20),
                  CustomListTile(
                    leading: GestureDetector(
                        onTap: () => displayDialog(
                              context,
                              Calendar(
                                minute: widget.minute,
                                hour: widget.hour,
                                description: widget.description,
                                tasktitle: widget.title,
                              ),
                            ),
                        child: const Icon(Icons.calendar_month_outlined)),
                    title: const Text(
                      'Task Date',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: textCard(widget.taskDate),
                  ),
                  const SizedBox(height: 40),
                  CustomListTile(
                    leading: GestureDetector(
                      onTap: () {
                        displayDialog(
                            context,
                            ConfirmDeleteWidget(
                                taskId: widget.taskId!, todo: widget.title));
                      },
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      ),
                    ),
                    title: const Text(
                      'Delete Task',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ),
                ],
              ),
              FullButton(
                  buttonText: 'Edit Task',
                  buttonFunction: () {},
                  height: sizer(false, 60.0, context),
                  width: MediaQuery.of(context).size.width),
            ],
          ),
        ),
      ),
    );
  }

  Container textCard(String text) => Container(
        height: 37,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      );
}

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final Widget? title, trailing;
  const CustomListTile({
    Key? key,
    required this.leading,
    this.title,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            leading,
            const SizedBox(width: 20),
            title ?? const Text(''),
          ],
        ),
        trailing ?? const Text('')
      ],
    );
  }
}
