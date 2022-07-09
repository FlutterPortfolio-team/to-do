import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/to_do.dart';
import 'package:to_do/view/home/index_screen.dart';
import 'package:to_do/view/widgets/app_text_field.dart';
import 'package:to_do/view/widgets/display_task_tile.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';
import 'package:to_do/view/widgets/task_widget.dart';
import 'package:to_do/view_model/to_do_vm.dart';

class EditTaskWidget extends StatefulWidget {
  final String tatskTitle, description;
  final int taskId;
  const EditTaskWidget(
      {Key? key,
      required this.tatskTitle,
      required this.description,
      required this.taskId})
      : super(key: key);

  @override
  State<EditTaskWidget> createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
  TextEditingController tatskTitleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  String data = '';
  List<Task> tasks = [];
  getTodos() async {
    final taskVm = Provider.of<TaskViewModel>(context, listen: false);
    data = await taskVm.tasksOfUser;
    tasks = Task.decode(data);
  }

  @override
  Widget build(BuildContext context) {
    tatskTitleController = TextEditingController(text: widget.tatskTitle);
    descriptionController = TextEditingController(text: widget.description);
    return PopUpContainer(
        setTodefault: true,
        height: 270,
        width: MediaQuery.of(context).size.width,
        title: 'Edit Task Title',
        button2Title: 'Save',
        button1Pressed: () => Navigator.pop(context),
        button2Pressed: () async {
          final taskVm = Provider.of<TaskViewModel>(context, listen: false);
          await taskVm.updateTask(
              widget.taskId, tatskTitleController.text.trim());
          await taskVm.getTaskByUser();
          getTodos();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IndexScreen(
                showBottomBar: true,
                body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final taskIndex = tasks[index];
                        return TaskTile(
                          description: 'description',
                          taskDate: 'taskDate',
                          todo: taskIndex.todo!,
                          hour: hour,
                          minute: '30',
                          taskId: taskIndex.id!,
                        );
                      }),
                ),
              ),
            ),
          );
        },
        body: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextField(
                labelText: '',
                controller: tatskTitleController,
              ),
              const SizedBox(height: 15),
              AppTextField(
                labelText: '',
                controller: descriptionController,
              ),
            ],
          ),
        ),
        showDivider: true);
  }
}
