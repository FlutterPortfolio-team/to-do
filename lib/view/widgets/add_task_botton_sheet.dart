import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/utils/display_dialog.dart';
import 'package:to_do/utils/drop_down.dart';
import 'package:to_do/utils/show_dialog.dart';
import 'package:to_do/view/home/index_screen.dart';
import 'package:to_do/view/widgets/app_text_field.dart';
import 'package:to_do/view/widgets/calender.dart';
import 'package:to_do/view/widgets/choose_time_widget.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';
import 'package:to_do/view/widgets/task_tile_builder.dart';
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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    AppCalender calendar = AppCalender();
    DateTime? currentDate = calendar.selectedDaytime;
    debugPrint(currentDate.toString());

    // ignore: unused_local_variable
    TaskWidget taskWidget;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: const Color(0xFF757575),
          child: Container(
            // height: height,
            decoration: const BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: PopUpContainer(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        if (tatskTitle.text.trim() == '' &&
                                                description.text.trim() == '' ||
                                            (tatskTitle.text.trim() == '' ||
                                                description.text.trim() ==
                                                    '')) {
                                          showMyDialog(
                                              context: context,
                                              firstText:
                                                  'One of the textfield is empty');
                                        } else {
                                          displayDialog(
                                              context,
                                              ChooseTimeWidget(
                                                onHourValueChanged: (value) {
                                                  debugPrint(
                                                      'This is the time in $hour');
                                                  setState(() {
                                                    hour = value;
                                                  });
                                                },
                                                onMinutesValueChanged: (value) {
                                                  setState(() {
                                                    minute = value;
                                                  });
                                                },
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
                                        }
                                      },
                                      child: Image.asset(
                                          'assets/Images/timer.png')),
                                  GestureDetector(
                                    onTap: () {
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
                                                    tatskTitle.text.trim(),
                                              ),
                                            ),
                                          ),
                                        );
                                        displayDialog(
                                            context,
                                            // appCalendar(
                                            //   context: context,
                                            //   selectedDateTime: currentDate,
                                            //   onDayPressed:
                                            //       (DateTime date, List<Event> events) {
                                            //     setState(() => currentDate = date);
                                            //     debugPrint(currentDate.toString());
                                            //   },
                                            // ),
                                            calendar);
                                      } else {
                                        showMyDialog(
                                            context: context,
                                            firstText:
                                                'One of the textfield is empty');
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            taskWidget = TaskWidget(
                                          minute: minute,
                                          hour: hour,
                                          description: description.text.trim(),
                                          taskTitle: tatskTitle.text.trim(),
                                        ),
                                      ));
                                } else {
                                  showMyDialog(
                                      context: context,
                                      firstText:
                                          'One of the textfield is empty');
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
      ),
    );
  }
}
