import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do/res/colors/general_color.dart';

import '../../res/size_calculator.dart';

class GeneralTextField extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final double? fontSize;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final bool multiline;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validator;
  final Widget? prefixIcon, suffixIcon;
  final StrutStyle? strutStyle;
  final TextAlignVertical? textAlignVertical;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  const GeneralTextField({
    Key? key,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.keyboardType,
    this.textController,
    this.textCapitalization,
    this.onSaved,
    this.fontSize,
    this.validator,
    this.textAlignVertical,
    this.strutStyle,
    this.autoValidateMode,
    this.multiline = false,
    this.inputFormatters,
    this.maxLength,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return TextFormField(
      focusNode: focusNode,
      maxLength: maxLength,

      textCapitalization: textCapitalization ?? TextCapitalization.none,
      controller: textController ?? _controller,
      onSaved: onSaved,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center, // textAlignVertical,
      autovalidateMode: autoValidateMode,
      maxLines: multiline ? 5 : 1,
      minLines: multiline ? 5 : 1,
      cursorHeight: sizer(true, 20.0, context),
      keyboardType: keyboardType ?? TextInputType.text,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: fontSize ?? sizer(true, 15.0, context)),
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 0.8,
            color: Colors.red,
          ),
        ),
        counter: const Offstage(),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:const BorderSide(
            width: 0.8,
            color: GenColors.grey,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: multiline
                ? sizer(false, 10, context)
                : sizer(false, 22, context),
            horizontal: sizer(true, 12, context)),
        fillColor: GenColors.kWhiteColor,
        hintText: hintText ?? '',
        hintStyle: TextStyle(
            color:GenColors.inputTextColor,
            fontSize: fontSize ?? sizer(true, 15, context),
            fontWeight: FontWeight.w400
            )
            ,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(sizer(true, 4, context)),
          borderSide: const BorderSide(
            width: 1.5,
            color:GenColors.kBlue,
          ),
        ),
        errorStyle: TextStyle(fontSize: sizer(true, 12, context)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(sizer(true, 4, context)),
          borderSide:const BorderSide(
            width: 1.5, color: GenColors.grey ,
            //  style: BorderStyle.none,
          ),
        ),
        filled: true,
      ),
    
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: validator ??
      //     (val) {
      //       if ((val?.length ?? 0) == 0) {
      //         return "${hintText ?? "Field"} is required";
      //       } else {
      //         return null;
      //       }
      //     },
    );
  }
}
