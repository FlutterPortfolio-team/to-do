import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/view/home/index_screen.dart';
import 'package:to_do/view/widgets/display_task_tile.dart';
import 'package:to_do/view/widgets/task_tile_builder.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.taskTitle,
    required this.description,
    required this.hour,
    required this.minute,
    required this.taskDate,
  }) : super(key: key);

  final String taskTitle, description, hour, minute, taskDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Text(taskTitle, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 50),
              Text(description, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 50),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/Images/timer.png',
                        color: Colors.black,
                      ),
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    todayTasks.add(DisplayTaskTile(
                      title: taskTitle,
                      description: description,
                      hour: hour,
                      minute: minutes,
                      taskDate: taskDate,
                    ));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndexScreen(
                                  showBottomBar: true,
                                  body: TaskTypeBuilder(
                                    tasks1: todayTasks,
                                    tasks2: completedTasks,
                                  ),
                                )));
                  },
                  child: Image.asset(
                    'assets/Images/send.png',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

DateTime dateTime = DateTime.now();
DateFormat formatter1 = DateFormat('hh');
DateFormat formatter2 = DateFormat('mm');
final hour = formatter1.format(dateTime);
final minutes = formatter2.format(dateTime);
List<DisplayTaskTile> todayTasks = [
  DisplayTaskTile(
    description: 'Go to work',
    hour: hour,
    minute: minutes,
    taskDate: '09/07/20',
    title: 'Sports',
  ),
  DisplayTaskTile(
    description: 'Play bet',
    hour: hour,
    minute: minutes,
    taskDate: '09/07/20',
    title: 'Sports',
  ),
  DisplayTaskTile(
    description: 'Get your hands dirty',
    hour: hour,
    minute: minutes,
    taskDate: '09/07/20',
    title: 'Go to school',
  ),
];
List<DisplayTaskTile> completedTasks = [
  DisplayTaskTile(
    description: 'Go to work',
    hour: hour,
    minute: minutes,
    taskDate: '09/07/20',
    title: 'Study',
  ),
  DisplayTaskTile(
    description: 'Play bet',
    hour: hour,
    minute: minutes,
    taskDate: '09/07/20',
    title: 'Sports',
  ),
  DisplayTaskTile(
    description: 'Get your hands dirty',
    hour: hour,
    minute: minutes,
    taskDate: '09/07/20',
    title: 'Sports',
  ),
];
