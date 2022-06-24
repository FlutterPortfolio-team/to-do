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
  @override
  Widget build(BuildContext context) {
    TextEditingController tatskTitle = TextEditingController();
    TextEditingController description = TextEditingController();

    double height = MediaQuery.of(context).size.height / 2.5;
    AppCalender calendar = AppCalender();
    DateTime? currentDate = calendar.selectedDaytime;
    debugPrint(currentDate.toString());
    String hour = '';
    String minute = '';
    TaskWidget taskWidget;
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 2.0),
        // padding: const EdgeInsets.all(30.0),
        height: height,
        decoration: const BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // const SizedBox(height: 10),
            PopUpContainer(
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => IndexScreen(
                                        showBottomBar: false,
                                        body: taskWidget = TaskWidget(
                                          minute: minute,
                                          hour: hour,
                                          description: description.text.trim(),
                                          taskTitle: tatskTitle.text.trim(),
                                        ),
                                      ),
                                    ),
                                  );
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
                                          if (tatskTitle.text.trim() != '' &&
                                              description.text.trim() != '') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const IndexScreen(
                                                          showBottomBar: true,
                                                          // body:
                                                          //     TaskTypeBuilder(),
                                                        )));
                                          }
                                        },
                                      ));
                                },
                                child: Image.asset('assets/Images/timer.png')),
                            // const Icon(Icons.alarm),
                            // Image.asset('assets/Images/tag.png'),
                            // Image.asset('assets/Images/flag.png'),
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
                                          description: description.text.trim(),
                                          taskTitle: tatskTitle.text.trim(),
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
                                  showMyDialog(context);
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
                                  builder: (context) => taskWidget = TaskWidget(
                                    minute: minute,
                                    hour: hour,
                                    description: description.text.trim(),
                                    taskTitle: tatskTitle.text.trim(),
                                  ),
                                ));
                          } else {
                            showMyDialog(context);
                          }
                        },
                        child: Image.asset('assets/Images/send.png'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
