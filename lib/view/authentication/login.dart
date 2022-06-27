import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:to_do/components/dialogs/button/full_button.dart';
import 'package:to_do/data/service/authentication_service.dart';
import 'package:to_do/helper/routes.dart';
import 'package:to_do/res/colors/general_color.dart';
import 'package:to_do/res/size_calculator.dart';

import '../../res/regex.dart';
import '../widgets/input_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  static final _lformKey = GlobalKey<FormState>();

  FocusNode focusNode = FocusNode();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthenticationService _auth =   AuthenticationService(FirebaseAuth.instance);



  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

Future loginUser() async {
  // Future.delayed(Duration(milliseconds: 5));
  print('--------------- enter home page-------------');
  await _auth.signIn(
    email: userNameController.text.trim(), 
    password: passwordController.text.trim(),
    context: context
    );
    
}





  //  Future loginUser() async {
  //   print('///////--- e reach overlay----///');
  //   final overlay = LoadingOverlay.of(context);
  //   return await overlay.during(preloginUser());
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _email;
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   leading: IconButton(
        //     iconSize: 28,
        //     color: GenColors.kBlue,
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     icon: Icon(Icons.arrow_back_ios_new_rounded),
        //   ),
        // ),
        body:        SafeArea(
          child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizer(true, 24.0, context),
                          vertical: sizer(false, 26.0, context)),
                          
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: sizer(true, 35.0, context),
                                  fontWeight: FontWeight.w700,
                                  color: GenColors.kBlue),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
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
                          hintText: 'Enter your username',
                          key: _lformKey,
                          focusNode: focusNode,
                          textController: userNameController,
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
                          textController: passwordController,
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
          
                        FullButton(
                            buttonText: 'Login',
                            buttonFunction: (){
                              loginUser();
                            },
                            height: sizer(false, 60.0, context),
                            width: MediaQuery.of(context).size.width
                            ),
                        SizedBox(
                          height: sizer(false, 36.0, context),
                        ),
                        Row(children: <Widget>[
                          Expanded(
                            child:  Container(
                                margin:
                                    const EdgeInsets.only(left: 10.0, right: 15.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 50,
                                )),
                          ),
                          Text(
                            "or",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: sizer(true, 15.0, context)),
                          ),
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
                            buttonFunction: () {},
                            isTextSmall: true,
                            height: 50.0,
                            isIcon: true,
                            width: MediaQuery.of(context).size.width),
                        SizedBox(
                          height: sizer(false, 45.0, context),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: GenColors.kBlue,
                                    fontSize: sizer(true, 14.0, context),
                                  )),
                              TextSpan(
                                  text: 'Register ',
                                  style: TextStyle(
                                      color: GenColors.kLightBlue,
                                      fontSize: sizer(true, 14.0, context),
                                      fontWeight: FontWeight.w700),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .pushNamed(Routes.signupRoute);
                                    }),
                            ]),
                          ),
                        ]),
                       
                      ]),
                    ),
                  ),
                ),
              ),
        )
           
           
           
             
          
        ,);    
            }

  //             _login() {
  //   return          
  //      SingleChildScrollView(
  //             child: GestureDetector(
  //               onTap: () {
  //                 FocusScopeNode currentFocus = FocusScope.of(context);
  //                 if (!currentFocus.hasPrimaryFocus) {
  //                   currentFocus.unfocus();
  //                 }
  //               },
  //               child: Container(
  //                 child: Padding(
  //                   padding: EdgeInsets.symmetric(
  //                       horizontal: sizer(true, 24.0, context)),
  //                   child: Column(children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           'Login',
  //                           style: TextStyle(
  //                               fontSize: sizer(true, 35.0, context),
  //                               fontWeight: FontWeight.w700,
  //                               color: GenColors.kBlue),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(height: 20),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           'Username',
  //                           style: TextStyle(
  //                               fontSize: sizer(true, 16.0, context),
  //                               fontWeight: FontWeight.w700,
  //                               color: GenColors.kBlue),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: sizer(false, 13.0, context),
  //                     ),
  //                     GeneralTextField(
  //                       hintText: 'Enter your username',
  //                       key: _lformKey,
  //                       focusNode: focusNode,
  //                       textController: userNameController,
  //                       keyboardType: TextInputType.emailAddress,
  //                       autoValidateMode: AutovalidateMode.onUserInteraction,
  //                       // hintText: "email",
  //                       validator: passwordVal,
  //                       onChanged: (val) => setState(() {
  //                         _email = val;
  //                       }),
  //                     ),
  //                     SizedBox(
  //                       height: sizer(false, 32.0, context),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           'Password',
  //                           style: TextStyle(
  //                               fontSize: sizer(true, 16.0, context),
  //                               fontWeight: FontWeight.w700,
  //                               color: GenColors.kBlue),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: sizer(false, 13.0, context),
  //                     ),
  //                     GeneralTextField(
  //                       textController: passwordController,
  //                       validator: passwordVal,
  //                       hintText: 'Password',
  //                       obscureText: obscurePassword,
  //                       inputFormatters: [
  //                         FilteringTextInputFormatter.deny(RegExp(r"\s"))
  //                       ],
  //                       onChanged: (val) => setState(() {}),
  //                       suffixIcon: IconButton(
  //                         onPressed: () {
  //                           setState(() {
  //                             obscurePassword = !obscurePassword;
  //                           });
  //                         },
  //                         icon: Icon(
  //                           obscurePassword
  //                               ? Icons.visibility_off_outlined
  //                               : Icons.visibility_outlined,
  //                           size: sizer(true, 24, context),
  //                           color: GenColors.black,
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: sizer(false, 35.0, context),
  //                     ),
        
  //                     FullButton(
  //                         buttonText: 'Login',
  //                         buttonFunction: loginUser(),
  //                         height: sizer(false, 60.0, context),
  //                         width: MediaQuery.of(context).size.width
  //                         ),
  //                     SizedBox(
  //                       height: sizer(false, 36.0, context),
  //                     ),
  //                     Row(children: <Widget>[
  //                       Expanded(
  //                         child:  Container(
  //                             margin:
  //                                 const EdgeInsets.only(left: 10.0, right: 15.0),
  //                             child: Divider(
  //                               color: Colors.black,
  //                               height: 50,
  //                             )),
  //                       ),
  //                       Text(
  //                         "or",
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.w500,
  //                             fontSize: sizer(true, 15.0, context)),
  //                       ),
  //                       Expanded(
  //                         child: new Container(
  //                             margin:
  //                                 const EdgeInsets.only(left: 15.0, right: 10.0),
  //                             child: Divider(
  //                               color: Colors.black,
  //                               height: 50,
  //                             )),
  //                       ),
  //                     ]),
  //                     SizedBox(
  //                       height: sizer(false, 36.0, context),
  //                     ),
  //                     FullButton(
  //                         buttonOnlineColor: GenColors.kWhiteColor,
  //                         iconAsset: 'assets/icons/go.svg',
  //                         buttonText: 'Login with Google',
  //                         onlineTextColor: GenColors.kBlue,
  //                         borderColor: GenColors.grey,
  //                         borderWidth: 1,
  //                         buttonFunction: () {},
  //                         isTextSmall: true,
  //                         height: 50.0,
  //                         isIcon: true,
  //                         width: MediaQuery.of(context).size.width),
  //                     SizedBox(
  //                       height: sizer(false, 45.0, context),
  //                     ),
  //                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //                       RichText(
  //                         text: TextSpan(children: [
  //                           TextSpan(
  //                               text: 'Don\'t have an account? ',
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.w700,
  //                                 color: GenColors.kBlue,
  //                                 fontSize: sizer(true, 14.0, context),
  //                               )),
  //                           TextSpan(
  //                               text: 'Register ',
  //                               style: TextStyle(
  //                                   color: GenColors.kLightBlue,
  //                                   fontSize: sizer(true, 14.0, context),
  //                                   fontWeight: FontWeight.w700),
  //                               recognizer: TapGestureRecognizer()
  //                                 ..onTap = () {
  //                                   Navigator.of(context)
  //                                       .pushNamed(Routes.signupRoute);
  //                                 }),
  //                         ]),
  //                       ),
  //                     ]),
  //                     SizedBox(
  //                       height: 34.0,
  //                     )
  //                   ]),
  //                 ),
  //               ),
  //             ),
  //           );
           
           
           

  // }




}
