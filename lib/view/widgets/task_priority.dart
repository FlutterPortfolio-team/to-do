import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpContainer(
        title: 'Task Priority',
        body: Column(),
        showDivider: true,
        setTodefault: false);
  }
}
