import 'package:flutter/material.dart';
import 'package:to_do/res/colors/general_color.dart';
import 'package:to_do/res/size_calculator.dart';

class ProfileTile extends StatefulWidget {
  final VoidCallback tileFunction;
  final String icon;
  final String text;
  final textColor;
  final tailColor;
  final iconColor;
  const ProfileTile({
     Key? key,
     required this.tileFunction, 
     required this.icon, 
     required this.text, 
     this.textColor,
     this.iconColor,
     this.tailColor
     })
      : super(key: key);

  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        InkWell(
          onTap: widget.tileFunction
          ,
              child: Column(
                children: [Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        widget.icon,
                        color: widget.iconColor ?? GenColors.kLightBlue,
                        height: sizer(true, 24.0, context),
                        width: sizer(true, 24.0, context),
                        ),
                         SizedBox(
                        width: sizer(true, 10.0, context),
                      ),
                      Text(widget.text, style: TextStyle(fontSize: sizer(true, 16.0, context), color: widget.textColor ?? GenColors.black),)
                    ],
                  ),
              
                 
              
                  Icon(Icons.arrow_forward_ios_rounded, color: widget.tailColor ?? GenColors.kLightBlue,
                  )
                  
                ],
                          ),
                          SizedBox(height: sizer(true, 15.0, context),)
                          
                          ]
              ),
          
        )
      ],
      
    );
  }
}