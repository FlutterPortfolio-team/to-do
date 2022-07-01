import 'package:flutter/material.dart';
import 'package:to_do/view/widgets/app_text_field.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';

class EditTaskWidget extends StatelessWidget {
  final String tatskTitle, description;
  EditTaskWidget(
      {Key? key, required this.tatskTitle, required this.description})
      : super(key: key);

  TextEditingController tatskTitleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    tatskTitleController = TextEditingController(text: tatskTitle);
    descriptionController = TextEditingController(text: description);
    return PopUpContainer(
        setTodefault: true,
        height: 270,
        width: MediaQuery.of(context).size.width,
        title: 'Edit Task Title',
        button2Title: 'Save',
        button1Pressed: () => Navigator.pop(context),
        button2Pressed: null,
        body: SizedBox(
          width: 250,
          child: Column(
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
