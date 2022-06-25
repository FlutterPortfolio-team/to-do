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
  }) : super(key: key);

  final String taskTitle;
  final String description;
  final String hour;
  final String minute;

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
                    tasks1.add(DisplayTaskTile(
                        description: description,
                        time: 'Today at $hour:$minute'));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndexScreen(
                                  showBottomBar: true,
                                  body: TaskTypeBuilder(
                                    tasks1: tasks1,
                                    tasks2: tasks2,
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
DateFormat formatter = DateFormat('hh:mm aaa');
final time = formatter.format(dateTime);
List<DisplayTaskTile> tasks1 = [
  DisplayTaskTile(
    description: 'Go to work',
    time: 'Todat at $time',
  ),
  DisplayTaskTile(
    description: 'Play bet',
    time: 'Todat at $time',
  ),
  DisplayTaskTile(
    description: 'Get your hands dirty',
    time: 'todat at $time',
  ),
];
List<DisplayTaskTile> tasks2 = [
  DisplayTaskTile(
    description: 'Go to work',
    time: 'Todat at $time',
  ),
  DisplayTaskTile(
    description: 'Play bet',
    time: 'Todat at $time',
  ),
  DisplayTaskTile(
    description: 'Get your hands dirty',
    time: 'Todat at $time',
  ),
];
