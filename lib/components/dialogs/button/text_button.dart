// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mEd/helpers/colors.dart';
// import 'package:mEd/helpers/size_calculator.dart';
// import 'package:flutter/services.dart';

// import '../../../res/size_calculator.dart';

// class CustomTextButton extends StatefulWidget {
//   final Function? buttonFunction;
//   final String? buttonText;
//   final bool online;
//   final bool isIcon;
//   final String? iconAsset;
//   final Color? buttonOnlineColor, onlineTextColor;

//   const CustomTextButton(
//       {Key? key,
//       required this.buttonFunction,
//       this.buttonText,
//       this.online = true,
//       this.buttonOnlineColor,
//       this.onlineTextColor,
//       this.isIcon = false,
//       this.iconAsset})
//       : super(key: key);

//   @override
//   _CustomTextButtonState createState() => _CustomTextButtonState();
// }

// class _CustomTextButtonState extends State<CustomTextButton> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         color: Colors.transparent,
//         child: InkWell(
//           highlightColor: Colors.transparent,
//           splashColor: Colors.transparent,
//           onTap: widget.online
//               ? widget.buttonFunction != null
//                   ? () {
//                       HapticFeedback.lightImpact();
//                       widget.buttonFunction!();
//                     }
//                   : () {
//                       HapticFeedback.lightImpact();
//                     }
//               : null,
//           child: Container(
//             // height: sizer(false, 40, context),
//             padding: const EdgeInsets.symmetric(vertical: 6.6),
//             margin: const EdgeInsets.symmetric(vertical: 0.0),
//             // decoration: BoxDecoration(
//             //     color: widget.online
//             //         ? (widget.buttonOnlineColor ?? AppColors.greenColor)
//             //         : AppColors.lightGrey,
//             //     borderRadius: BorderRadius.circular(8)),
//             child: widget.isIcon
//                 ? Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(
//                         widget.iconAsset ?? '',
//                         color: (widget.onlineTextColor ?? Colors.white),
//                       ),
//                       SizedBox(width: sizer(true, 14, context)),
//                       Text(widget.buttonText ?? '',
//                           style: TextStyle(
//                               color: widget.online
//                                   ? (widget.onlineTextColor ?? Colors.white)
//                                   : AppColors.text3,
//                               fontSize: sizer(true, 13, context),
//                               fontWeight: FontWeight.w700))
//                     ],
//                   )
//                 : Center(
//                     child: Text(widget.buttonText ?? '',
//                         style: TextStyle(
//                             color: widget.online
//                                 ? (widget.onlineTextColor ?? Colors.white)
//                                 : AppColors.text3,
//                             fontSize: sizer(true, 13, context),
//                             fontWeight: FontWeight.w500))),
//           ),
//         ));
//   }
// }
