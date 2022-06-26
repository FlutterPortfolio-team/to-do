import 'package:flutter/material.dart';
import 'package:to_do/res/app_context_extension.dart';

class ThemeHelper {
  InputDecoration textInputDecoration(BuildContext context,
      [String lableText = "", String hintText = "", Color? color]) {
    return InputDecoration(
      labelText: lableText,
      labelStyle:
          TextStyle(color: context.resources.color.colorWhite, fontSize: 18),
      hintText: hintText,
      hintStyle:
          TextStyle(color: context.resources.color.colorWhite, fontSize: 18),
      fillColor: color ?? context.resources.color.buttonBlue,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: context.resources.color.colorWhite)),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    );
  }
}
