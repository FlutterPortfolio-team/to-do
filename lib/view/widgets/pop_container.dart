import 'package:flutter/material.dart';
import 'package:to_do/res/app_context_extension.dart';
import 'package:to_do/view/widgets/app_button.dart';

class PopUpContainer extends StatelessWidget {
  final String title;
  final Widget body;
  final double? height;
  final double? width;
  final bool showDivider;
  final VoidCallback? button1Pressed;
  final VoidCallback? button2Pressed;
  const PopUpContainer({
    Key? key,
    required this.title,
    required this.body,
    this.height,
    this.width,
    this.button1Pressed,
    this.button2Pressed,
    required this.showDivider,
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height == null ? (size - 100) : (height! - 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: context.resources.color.colorWhite,
                          fontSize: 18),
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
          Row(
            children: [
              AppButton(
                text: 'Cancel',
                useSecondColor: false,
                onPressed: button1Pressed,
              ),
              AppButton(
                text: 'Edit',
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
