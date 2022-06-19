import 'package:flutter/material.dart';
import '../../res/colors/app_colors.dart';
import '../../res/size_calculator.dart';
import 'button/full_button.dart';


displayAlert(
    {String title = '',
     required BuildContext context,
    String content = '',
    String callToAction = '',
    bool success = true,
    Widget? nairaContent,
    bool useNairaContent = false}) async {
      bool editName = false;

  await 
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: widget),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: sizer(true, 10, context), vertical: 24.0),
          contentPadding: EdgeInsets.symmetric(
            horizontal: sizer(true, 5, context),
            vertical: sizer(false, 17, context),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          content: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: sizer(true, 13, context),
                    color: AppColors().buttonBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: sizer(false, 10, context),
              ),
              Divider(),
                SizedBox(
                height: sizer(false, 16, context),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: sizer(true, 13, context),
                  color:AppColors().blueAppColor,
                  fontWeight: FontWeight.w400,
                  height: sizer(true, 1.5, context),
                ),
              ),
              SizedBox(
                height: sizer(false, 10, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  
                  FullButton(
                  height: 48,
                  width: 153,
                    buttonText: callToAction,
                    buttonFunction: () async {
                      Navigator.of(context, rootNavigator: true).pop();
                    }),

                  FullButton(
                  height: 48,
                  width: 153,
                    buttonText: callToAction,
                    buttonFunction: () async {
                      Navigator.of(context, rootNavigator: true).pop();
                    }),
                ],
              )
            ],
          ),
        
        
        );
      });



}
