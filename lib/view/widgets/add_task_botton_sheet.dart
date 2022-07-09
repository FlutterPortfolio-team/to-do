import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/to_do.dart';
import 'package:to_do/utils/display_dialog.dart';
import 'package:to_do/utils/show_dialog.dart';
import 'package:to_do/view/home/index_screen.dart';
import 'package:to_do/view/widgets/app_text_field.dart';
import 'package:to_do/view/widgets/calender.dart';
import 'package:to_do/view/widgets/choose_time_widget.dart';
import 'package:to_do/view/widgets/display_task_tile.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';
import 'package:to_do/view/widgets/task_widget.dart';
import 'package:to_do/view_model/to_do_vm.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController description = TextEditingController();
  String hour = '';
  String minute = '';
  DateTime currentTime = DateTime.now();

  String data = '';
  List<Task> tasks = [];
  getTodos() async {
    final taskVm = Provider.of<TaskViewModel>(context, listen: false);
    data = await taskVm.tasksOfUser;
    tasks = Task.decode(data);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2.5;
    getTodos();
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: const Color(0xFF757575),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: PopUpContainer(
                  isAddTask: MainAxisAlignment.start,
                  setTodefault: true,
                  width: MediaQuery.of(context).size.width,
                  height: height,
                  title: 'Add Task',
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextField(
                        labelText: 'Task Title',
                        controller: taskTitle,
                      ),
                      const SizedBox(height: 15),
                      AppTextField(
                        labelText: 'Description',
                        controller: description,
                      ),
                    ],
                  ),
                  showDivider: false,
                  trailingWidget: Padding(
                    padding: const EdgeInsets.only(right: 50.0, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      displayDialog(
                                          context,
                                          ChooseTimeWidget(
                                            onHourValueChanged: (value) =>
                                                hour = value,
                                            onMinutesValueChanged: (value) =>
                                                minute = value,
                                            onTimeValueChanged: (time) =>
                                                debugPrint(time.toString()),
                                            onSaved: () {
                                              if (hour.isEmpty ||
                                                  minute.isEmpty ||
                                                  (hour.isEmpty &&
                                                      minute.isEmpty)) {
                                                // Navigator.pop(context);
                                                showMyDialog(
                                                    context: context,
                                                    firstText:
                                                        'Please set the time');
                                              } else {
                                                Navigator.pop(context);
                                              }
                                            },
                                          ));
                                    },
                                    child:
                                        Image.asset('assets/Images/timer.png')),
                                GestureDetector(
                                  onTap: () {
                                    if ((minute != '' && hour != '')) {
                                      if (taskTitle.text.trim() != '' &&
                                          description.text.trim() != '') {
                                        displayDialog(
                                          context,
                                          Calendar(
                                            minute: minute,
                                            hour: hour,
                                            description:
                                                description.text.trim(),
                                            tasktitle: taskTitle.text.trim(),
                                          ),
                                        );
                                      } else {
                                        showMyDialog(
                                            context: context,
                                            firstText:
                                                'One of the textfield is empty');
                                      }
                                    } else {
                                      showMyDialog(
                                          context: context,
                                          firstText: 'Please set the time');
                                    }
                                  },
                                  child: const Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              if (taskTitle.text.trim() != '' &&
                                  description.text.trim() != '') {
                                if ((minute != '' && hour != '')) {
                                  final taskVm = Provider.of<TaskViewModel>(
                                      context,
                                      listen: false);
                                  await taskVm
                                      .createTask(taskTitle.text.trim());
                                  await taskVm.getTaskByUser();
                                  getTodos();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => IndexScreen(
                                        showBottomBar: true,
                                        body: SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: ListView.builder(
                                              itemCount: tasks.length,
                                              itemBuilder: (context, index) {
                                                final taskIndex = tasks[index];
                                                return TaskTile(
                                                  description: 'description',
                                                  taskDate: 'taskDate',
                                                  todo: taskIndex.todo!,
                                                  hour: hour,
                                                  minute: minute,
                                                  taskId: taskIndex.id!,
                                                );
                                              }),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  showMyDialog(
                                      context: context,
                                      firstText: 'Please set the time');
                                }
                              } else {
                                showMyDialog(
                                    context: context,
                                    firstText: 'One of the textfield is empty');
                              }
                            },
                            child: Image.asset('assets/Images/send.png'))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
