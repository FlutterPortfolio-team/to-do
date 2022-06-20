import 'package:flutter/material.dart';
import 'package:to_do/view/widgets/app_text_field.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2.5;
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
            PopUpContainer(
              setTodefault: true,
              width: MediaQuery.of(context).size.width,
              height: height,
              title: 'Add Task',
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppTextField(labelText: 'Add Task'),
                  SizedBox(height: 50),
                  AppTextField(labelText: 'Description'),
                ],
              ),
              showDivider: false,
              trailingWidget: Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/Images/timer.png'),
                          Image.asset('assets/Images/tag.png'),
                          Image.asset('assets/Images/flag.png'),
                        ],
                      ),
                    ),
                    Image.asset('assets/Images/send.png'),
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
