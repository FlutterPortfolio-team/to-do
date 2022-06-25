import 'package:flutter/material.dart';
import 'package:to_do/res/app_context_extension.dart';
import 'package:to_do/utils/theme_helper.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboard;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  const AppTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.keyboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is required";
          }
          return null;
        },
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboard,
        // textInputAction: TextInputAction.go,
        style:
            TextStyle(color: context.resources.color.colorWhite, fontSize: 18),
        decoration: ThemeHelper().textInputDecoration(
          context,
          labelText == null ? '' : labelText!,
          hintText == null ? '' : hintText!,
        ),
      ),
    );
  }
}
