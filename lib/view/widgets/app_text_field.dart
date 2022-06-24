import 'package:flutter/material.dart';
import 'package:to_do/res/app_context_extension.dart';
import 'package:to_do/utils/theme_helper.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  const AppTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.controller,
    this.validator,
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
