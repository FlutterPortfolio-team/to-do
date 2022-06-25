import 'package:flutter/material.dart';
import 'package:to_do/components/dialogs/button/full_button.dart';
import 'package:to_do/res/colors/general_color.dart';
import 'package:to_do/res/size_calculator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
      var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:Colors.white
      ,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: sizer(true, 24.0, context), right:  sizer(true, 24.0, context), top: sizer(false, 13.0, context) , bottom:  sizer(false, 48.0, context) ),
          child: Column(
            children: [
              Row(
                children: [
                  ButtonTheme(
                  minWidth: 20.0,
                  height: 100.0,
                    child: Container(
                      width: 20.0,
                      child: ElevatedButton(                  
                              style: ElevatedButton.styleFrom(
                                primary: GenColors.kBlue,
                                elevation: 0,
                                fixedSize: Size(15.0, 24.0)
                              ),
                              onPressed: () {
                                (Navigator.of(context).pop());
                              }, 
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded, 
                                color: Colors.white,
                                size: 20 ,
                                ) ),
                    ),
                  ),

        
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  'Welcome to DoTick',
                  style: TextStyle(
                    fontSize: sizer(true, 35.0, context),
                    color: GenColors.kBlue,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: sizer(false, 5.0, context),),
                 Text(
                  
                  'Please login or create a new account to continue ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: sizer(true, 16.0, context),
                      color: GenColors.PrimaryColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: sizer(false, 131.0, context),
                ),

                Image.asset('assets/images/welcome.jpg')
                ],
              ),
               SizedBox(
              height: sizer(false, 34.0, context),
            ),
            FullButton(
              buttonFunction: (){

              },
              height: sizer(false, 51.0, context), 
              width: width,
              buttonText: 'LOGIN',
              isTextSmall: true,
              textWidth: FontWeight.w500,
              ),
              SizedBox(height: sizer(false, 11.0, context),),
              FullButton(
                borderWidth: 2.0,
                borderColor: GenColors.kLightBlue,
                buttonFunction:(){} , 
                height: sizer(false, 51.0, context), 
                width: width,
                buttonText: 'Create account',
                onlineTextColor: Colors.black54,
                isTextSmall: true,
                buttonOnlineColor: Colors.white
                )
            ],
          ),
          )
        ),
      
    );
  }
}