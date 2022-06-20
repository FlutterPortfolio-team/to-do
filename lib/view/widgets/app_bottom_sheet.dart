// import 'package:flutter/material.dart';
// import 'package:to_do/view/widgets/add_task_widget.dart';

// displayDialog(BuildContext context) {
//   showGeneralDialog(
//     context: context,
//     barrierDismissible: false,
//     transitionDuration: const Duration(milliseconds: 2000),
//     transitionBuilder: (context, animation, secondaryAnimation, child) {
//       return FadeTransition(
//         opacity: animation,
//         child: ScaleTransition(
//           scale: animation,
//           child: child,
//         ),
//       );
//     },
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return const SafeArea(
//         child: AddTaskWidget(),
//       );
//     },
//   );
// }
