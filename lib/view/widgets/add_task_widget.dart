import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do/res/app_context_extension.dart';
import 'package:to_do/utils/theme_helper.dart';
import 'package:to_do/view/widgets/app_button.dart';
import 'package:to_do/view/widgets/app_text_field.dart';
import 'package:to_do/view/widgets/pop_container.dart';

class AddTaskWidget extends StatelessWidget {
  // final String title;
  // final Widget body;
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpContainer(
        title: 'Add Task',
        showDivider: false,
        body: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppTextField(labelText: 'Add Task'),
              AppTextField(labelText: 'Add Duration'),
            ],
          ),
        ));
  }
}


// Container(
//       height: size,
//       width: size,
//       padding: const EdgeInsets.only(bottom: 8.0),
//       decoration: BoxDecoration(
//         color: context.resources.color.buttonBlue,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(10.0),
//           topRight: Radius.circular(10.0),
//           bottomLeft: Radius.circular(10.0),
//           bottomRight: Radius.circular(10.0),
//         ),
//       ),
//       child: Column(
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Add Task',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: context.resources.color.colorWhite, fontSize: 18),
//           ),
//           const Divider(
//             color: Colors.grey,
//           ),
//           
//           Row(
//             children: const [
//               AppButton(text: 'Cancel', useSecondColor: false),
//               AppButton(text: 'Edit', useSecondColor: true)
//             ],
//           )
//         ],
//       ),
//     );