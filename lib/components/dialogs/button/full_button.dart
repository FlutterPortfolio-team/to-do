import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do/res/colors/general_color.dart';
import 'package:to_do/res/size_calculator.dart';



class FullButton extends StatefulWidget {
  final Function? buttonFunction;
  final String? buttonText, iconAsset;
  final FontWeight? textWidth;
  final bool isIcon;
  final double height;
  final double width;
  final double? borderWidth;
  final bool isTextSmall;
  final Color? buttonOnlineColor, onlineTextColor, borderColor;

  const FullButton(
      {Key? key,
      required this.buttonFunction,
      this.buttonText,
      this.textWidth,
      this.borderWidth,
      this.buttonOnlineColor,
      this.borderColor,
      this.onlineTextColor,
      this.isIcon = false,
      this.isTextSmall = false,
      this.iconAsset,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  _FullButtonState createState() => _FullButtonState();
}

class _FullButtonState extends State<FullButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: widget.buttonFunction != null
              ? () {
                  HapticFeedback.lightImpact();
                  widget.buttonFunction!();
                }
              : () {},
          child: Container(
            height: widget.height,
            width: widget.width,
            padding: const EdgeInsets.symmetric(vertical: 6.6),
            margin: const EdgeInsets.symmetric(vertical: 0.0),
            decoration: BoxDecoration(
                color: (widget.buttonOnlineColor ?? GenColors.kLightBlue),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: widget.borderWidth ?? 0,
                  color: widget.borderColor ?? Colors.transparent
                )
                ),
            child: Center(
                child: Text(widget.buttonText ?? '',
                    style: TextStyle(
                        color: (widget.onlineTextColor ?? GenColors.kWhiteColor),
                        fontSize: widget.isTextSmall == true ? 
                        sizer(true, 14.0, context) :
                        sizer(true, 16.0, context)
                        
                            ,
                        fontWeight: widget.textWidth?? FontWeight.w400))),
          ),
        ));
  }
}
