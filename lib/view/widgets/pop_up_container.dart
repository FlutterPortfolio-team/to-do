import 'package:flutter/material.dart';
import 'package:to_do/res/app_context_extension.dart';
import 'package:to_do/res/size_calculator.dart';
import 'package:to_do/view/widgets/app_button.dart';

class PopUpContainer extends StatelessWidget {
  final String title;
  final String? button1Title;
  final String? button2Title;
  final Widget body;
  final isAddTask;
  final Widget? trailingWidget;
  final double? height;
  final double? width;
  final bool showDivider;
  final bool setTodefault;
  final VoidCallback? button1Pressed;
  final VoidCallback? button2Pressed;
   PopUpContainer({
    Key? key,
    required this.title,
    required this.body,
    this.isAddTask,
    this.height,
    this.width,
    this.button1Pressed,
    this.button2Pressed,
    required this.showDivider,
    this.button1Title,
    this.button2Title,
    this.trailingWidget,
    required this.setTodefault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 350.0;
    return Container(
      height: height ?? size,
      width: width ?? size,
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: context.resources.color.buttonBlue,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
          bottomLeft: setTodefault
              ? const Radius.circular(0.0)
              : const Radius.circular(10.0),
          bottomRight: setTodefault
              ? const Radius.circular(0.0)
              : const Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height == null ? (size - 100) : (height! - 100),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  
                  children: [
                    SizedBox(
                      height: sizer(false, 25.0, context),
                    ),
                    Row(
                      mainAxisAlignment: isAddTask ??  MainAxisAlignment.center ,
                      children:[ Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: context.resources.color.colorWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      )],
                    ),
                    showDivider
                        ? const Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          )
                        : const Text(''),
                  ],
                ),
                body,
              ],
            ),
          ),
          trailingWidget ??
              Row(
                children: [
                  AppButton(
                    text: button1Title ?? 'Cancel',
                    useSecondColor: false,
                    onPressed: button1Pressed,
                  ),
                  AppButton(
                    text: button2Title ?? 'Edit',
                    useSecondColor: true,
                    onPressed: button2Pressed,
                  )
                ],
              )
        ],
      ),
    );
  }
}
