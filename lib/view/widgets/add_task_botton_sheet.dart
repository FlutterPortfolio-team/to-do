import 'package:flutter/material.dart';
import 'package:to_do/utils/display_dialog.dart';
import 'package:to_do/utils/show_dialog.dart';
import 'package:to_do/view/home/index_screen.dart';
import 'package:to_do/view/widgets/app_text_field.dart';
import 'package:to_do/view/widgets/calender.dart';
import 'package:to_do/view/widgets/choose_time_widget.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';
import 'package:to_do/view/widgets/task_widget.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController tatskTitle = TextEditingController();
  TextEditingController description = TextEditingController();
  String hour = '';
  String minute = '';
  DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2.5;

    // DateTime? currentDate = calendar.selectedDaytime;
    // debugPrint(currentDate.toString());

    // ignore: unused_local_variable
    TaskWidget taskWidget;
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
                        controller: tatskTitle,
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
                                      if (tatskTitle.text.trim() != '' &&
                                          description.text.trim() != '') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => IndexScreen(
                                              showBottomBar: false,
                                              body: taskWidget = TaskWidget(
                                                minute: minute,
                                                hour: hour,
                                                description:
                                                    description.text.trim(),
                                                taskTitle:
                                                    tatskTitle.text.trim(), taskDate: '',
                                              ),
                                            ),
                                          ),
                                        );
                                        displayDialog(
                                          context,
                                        Calendar(
                                          minute: minute,
                                          hour: hour,
                                          description: description.text.trim(),
                                          tasktitle: tatskTitle.text.trim(),
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
                            onTap: () {
                              if (tatskTitle.text.trim() != '' &&
                                  description.text.trim() != '') {
                                if ((minute != '' && hour != '')) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => IndexScreen(
                                        showBottomBar: false,
                                        body: taskWidget = TaskWidget(
                                          minute: minute,
                                          hour: hour,
                                          description: description.text.trim(),
                                          taskTitle: tatskTitle.text.trim(), taskDate: '',
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

  // void onDayPressed(DateTime date, List<Event> events) {
  //   setState(() {
  //     currentTime = date;
  //     debugPrint(currentTime.toString());
  //     // selectedDaytime = _currentDate;
  //   });
  // }
}
