 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/components/dialogs/button/full_button.dart';
import 'package:to_do/helper/routes.dart';
import 'package:to_do/res/colors/general_color.dart';
import 'package:to_do/res/size_calculator.dart';

import '../../data/service/authentication_service.dart';
import '../../res/regex.dart';
import '../widgets/input_field.dart';

 
 class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
   static final _formKey = GlobalKey<FormState>();
   FocusNode focusNode = FocusNode();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController newPasswordEditingController = TextEditingController();
  TextEditingController confrimPasswordEditingController =
      TextEditingController();
  final AuthenticationService _auth = AuthenticationService(FirebaseAuth.instance);

  String? _email;
  bool obscurePassword = true;
  

   showCustomToast() {
    Fluttertoast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      msg: 'Password doesn\'t match' ,
    );
  }

  Future signUpUser() async {
    // Future.delayed(Duration(milliseconds: 5));
    print('--------------- enter home page-------------');
    if( newPasswordEditingController.text.trim() != confrimPasswordEditingController.text.trim()){
      showCustomToast();
      newPasswordEditingController.clear();
      confrimPasswordEditingController.clear();
    } else {
    await _auth.signUp(
        email: emailEditingController.text.trim(),
        password: newPasswordEditingController.text.trim(),
        context: context);
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    emailEditingController.dispose();
    newPasswordEditingController.dispose();
    confrimPasswordEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:  IconButton(
          iconSize: 28,
                      color: GenColors.kBlue,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
       
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if(!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sizer(true, 24.0, context) ),
              child: Column(
                children: [

                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: sizer(true, 35.0, context),
                            fontWeight: FontWeight.w700,
                            color: GenColors.kBlue),
                      )
                    ],
                  ),
                  const SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[ Text(
                      'Email', 
                    style:  TextStyle(
                      fontSize: sizer(true, 16.0, context),
                      fontWeight: FontWeight.w700,
                      color: GenColors.kBlue
                    ),)],
                  ),
                  SizedBox(
                    height: sizer(false, 13.0, context),
                  ),
                  GeneralTextField(
                    hintText: 'Enter your email',
                    key: _formKey,
                    focusNode: focusNode,
                    textController: emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    // hintText: "email",
                    validator: passwordVal,
                    onChanged: (val) => setState(() {
                      _email = val;
                    }),
                  ),
                  SizedBox(
                    height: sizer(false, 32.0, context),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: sizer(true, 16.0, context),
                            fontWeight: FontWeight.w700,
                            color: GenColors.kBlue),
                      )
                    ],
                  ),
                  SizedBox(
                    height: sizer(false, 13.0, context),
                  ),
                  GeneralTextField(
                    textController: newPasswordEditingController,
                    validator: passwordVal,
                    hintText: 'Password',
                    obscureText: obscurePassword,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"\s"))
                    ],
                    onChanged: (val) => setState(() {}),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: sizer(true, 24, context),
                        color: GenColors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizer(false, 35.0, context),
                  ),
                  
                     Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontSize: sizer(true, 16.0, context),
                            fontWeight: FontWeight.w700,
                            color: GenColors.kBlue),
                      )
                    ],
                  ),
                 
                  SizedBox(
                    height: sizer(false, 13.0, context),
                  ),
      
      
                    GeneralTextField(
                    textController: confrimPasswordEditingController,
                    validator: passwordVal,
                    hintText: 'Confirm Password',
                    obscureText: obscurePassword,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"\s"))
                    ],
                    onChanged: (val) => setState(() {}),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: sizer(true, 24, context),
                        color: GenColors.black,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: sizer(false, 71.0, context),
                  ),

                  FullButton(
                    buttonText: 'Register',
                    buttonFunction: (){
                      signUpUser();
                    }, 
                    height: sizer(false, 60.0, context), 
                    width: width),

                    SizedBox(
                      height: sizer(false, 36.0, context),
                    ),

                     Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                    Text("or", style: TextStyle(fontWeight: FontWeight.w500, fontSize: sizer(true, 15.0, context)),),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                  ]),

                  SizedBox(
                    height: sizer(false, 36.0, context),
                  ),
                  FullButton(
                    buttonOnlineColor: GenColors.kWhiteColor,
                    iconAsset: 'assets/icons/go.svg',
                    buttonText: 'Login with Google',
                    onlineTextColor: GenColors.kBlue,
                    borderColor: GenColors.grey,
                    borderWidth: 1,
                    buttonFunction: (){}, 
                    isTextSmall: true,
                    height: 50.0, 
                    isIcon: true,
                    width: width),
                    SizedBox(
                      height: sizer(false, 45.0, context),
                    ),
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[ RichText(
                    text:  TextSpan(children: [
                        TextSpan(
                            text: 'Have an account? ',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, 
                                color:GenColors.kBlue,
                                 fontSize: sizer(true, 14.0, context),
                                )),
                            
                        TextSpan(
                            text: 'Login ',
                            style: TextStyle(
                                color: GenColors.kLightBlue,
                                fontSize: sizer(true, 14.0, context),
                                fontWeight: FontWeight.w700
                                ),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(Routes.loginRoute);
                            }
                                
                                ),
                    
                    ]),
                  ),]
                      ),

                      const SizedBox(height: 34.0,)


                          
      
                ]
              ),
            ),
          ),
        ),
      )
    );

    
    
  }
}
 
    