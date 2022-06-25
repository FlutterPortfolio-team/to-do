import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/utils/drop_down.dart';
import 'package:to_do/view/widgets/display_task_tile.dart';

List<String> categories1 = [
  'Go to work',
  'Play bet',
  'Get your hands dirty',
];
List<String> categories2 = [
  'Get your hands dirty',
  'Play bet',
  'Go to work',
];
String? selectedValue;

class TaskTileWidget extends StatefulWidget {
  final List<Widget> tasks;
  final List<String> categories;
  const TaskTileWidget(
      {Key? key, required this.tasks, required this.categories})
      : super(key: key);

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  double? assignHeight(List<Widget> list) {
    double height = 92.5;
    for (int i = 0; i < list.length; i++) {
      height + 92.5;
    }
    return height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: assignHeight(widget.tasks),
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: widget.tasks,
      ),
    );
  }
}

class TaskTileView extends StatefulWidget {
  final String taskTypep;
  final List<Widget> tasks;
  final List<String> categories;
  const TaskTileView(
      {Key? key,
      required this.taskTypep,
      required this.tasks,
      required this.categories})
      : super(key: key);

  @override
  State<TaskTileView> createState() => _TaskTileViewState();
}

class _TaskTileViewState extends State<TaskTileView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: dropDown(
              context: context,
              title: widget.taskTypep,
              categories: categories2,
              onChanged: onChanged,
              selectedValue: selectedValue,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: TaskTileWidget(
                  tasks: widget.tasks, categories: widget.categories)),
        ],
      ),
    );
  }

  onChanged(value) {
    setState(() {
      selectedValue = value as String;
    });
  }
}

class TaskTypeBuilder extends StatelessWidget {
  final List<Widget> tasks1;
  final List<Widget> tasks2;
  const TaskTypeBuilder({Key? key, required this.tasks1, required this.tasks2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550 + 100,
      child: ListView(
        children: [
          TaskTileView(
              taskTypep: 'Today', tasks: tasks1, categories: categories1),
          TaskTileView(
              taskTypep: 'Completed', tasks: tasks2, categories: categories2),
        ],
      ),
    );
  }
}
