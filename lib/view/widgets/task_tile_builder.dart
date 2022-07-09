import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/to_do.dart';
import 'package:to_do/res/app_context_extension.dart';
import 'package:to_do/view/widgets/display_task_tile.dart';
import 'package:to_do/view_model/to_do_vm.dart';

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
      child: ListView(
        children: widget.tasks,
      ),
    );
  }
}

class TaskTileView extends StatefulWidget {
  final String taskTypep;
  final List<Widget> tasks;
  final List<String> categories;
  final String? description, title, taskDate, hour, minute;
  const TaskTileView(
      {Key? key,
      required this.taskTypep,
      required this.tasks,
      required this.categories,
      this.description,
      this.title,
      this.taskDate,
      this.hour,
      this.minute})
      : super(key: key);

  @override
  State<TaskTileView> createState() => _TaskTileViewState();
}

class _TaskTileViewState extends State<TaskTileView> {
  List<Task> task = [];
  String taskData = '';
  getTaskOfUser(BuildContext context) async {
    taskData = await Provider.of<TaskViewModel>(context).tasksOfUser;
    task = Task.decode(taskData);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ElevatedButton(
                    onPressed: null,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: context.resources.color.buttonBlue),
                    child: Text(
                      widget.taskTypep,
                      style: const TextStyle(color: Colors.white),
                    )),
              )
              // child: dropDown(
              //   context: context,
              //   title: widget.taskTypep,
              //   categories: categories2,
              //   onChanged: onChanged,
              //   selectedValue: selectedValue,
              // ),
              ),
          const SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  final data = task[index];
                  return DisplayTaskTile(
                      description: widget.description!,
                      taskDate: widget.taskDate!,
                      title: data.todo!,
                      hour: widget.hour!,
                      minute: widget.minute!);
                }),
          ),
          // Expanded(
          //     child: TaskTileWidget(
          //         tasks: widget.tasks, categories: widget.categories)),
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
  final List<Widget>? tasks1;
  final List<Widget>? tasks2;
  const TaskTypeBuilder({Key? key, this.tasks1, this.tasks2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550 + 100,
      child: ListView(
        children: [
          TaskTileView(
              taskTypep: 'Today', tasks: tasks1!, categories: categories1),
          TaskTileView(
              taskTypep: 'Completed', tasks: tasks2!, categories: categories2),
        ],
      ),
    );
  }
}
