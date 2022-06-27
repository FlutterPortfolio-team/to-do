
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/res/colors/general_color.dart';
import 'package:async/async.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/onboarding_data.dart';
import '../../res/size_calculator.dart';
import 'onboarding_content.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  bool showBtnLoader = false;
  final _controller = PageController();
  List<Image> images = [];
  RestartableTimer timer = RestartableTimer(const Duration(seconds: 10), () {});
  Duration scrollDuration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(
              left: sizer(true, 16.5, context),
              right: sizer(true, 16.5, context),
              bottom: sizer(false, 35, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  // SizedBox(
                  //   height: 32.0,
                  // ),
            
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Stack(
                      fit: StackFit.expand, // StackFit.expand fixes the issue
                      children: [
                        PageView.builder(
                          controller: _controller,
                          onPageChanged: (value) {
                            setState(() {
                              currentIndex = value;
                            });
                            // timer.reset();
                          },
                          itemCount: onboardingData.length,
                          itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OnboardingContent(
                                  title: onboardingData[index].title,
                                  imageSrc: onboardingData[index].imageSrc,
                                  description:
                                      onboardingData[index].description,
                                  dataLength: onboardingData.length,
                                  currentIndex: index.toDouble(),
                                ),
                              ]),
                        ),
                      ])),

                      Center(
                        child: SmoothPageIndicator(
                  controller: _controller,
                  count:3,
                  effect: const WormEffect(
                     spacing : 8,
                  radius : 4,
                  dotWidth : 26.28,
                  dotHeight : 4,
                  activeDotColor : GenColors.kBlue,
                  ),
                  onDotClicked: (index) => _controller.animateToPage(
                    index, 
                    duration: const Duration(milliseconds: 500), 
                    curve: Curves.easeInOut),
                  
            //       SlideEffect(
            //       spacing : 8,
            //       radius : 4,
            //       dotWidth : 26.28,
            //       dotHeight : 4,
            //       activeDotColor : GenColors.kBlue,
            // ),
                      )),
                      

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        currentIndex==2 ? _controller.jumpToPage(currentIndex-1):
                        _controller.jumpToPage(onboardingData.length -1,
                        );
                      },
                      child: Text(
                       currentIndex==2 ? 'Back' :'Skip',
                        style: const TextStyle(color: GenColors.kBlue),
                      )),
                  Row(
                    children: [
                        currentIndex != 2 ?
                      SizedBox(
                        height: sizer(false, 41.0, context),
                        width: sizer(true, 81.0, context),
                        child: ElevatedButton(
                            onPressed: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 500), 
                                curve: Curves.easeInOut);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: GenColors.kLightBlue,
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            )),
                      ):
                      SizedBox(
                        height: sizer(false, 41.0, context),
                        width: sizer(true, 129.0, context),
                        child: ElevatedButton(
                            onPressed: () async{
                              final prefs = await SharedPreferences.getInstance();
                              prefs.setBool('showHome', true);
                              Navigator.of(context).pushNamed('welcomeScreen');
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: GenColors.kLightBlue,
                            ),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(color: Colors.white),

                            )),
                      )
                    ],
                  ),
                ],
              )

              // DotsIndicator(
              //   dotsCount: onboardingData.length,
              //   position: currentIndex.toDouble(),
              //   decorator: const DotsDecorator(
              //     color: AppColors.lightGreyColor, // Inactive color
              //     activeColor: AppColors.greyColor,
              //   ),
              // ),
              // SizedBox(
              //   height: sizer(false, 42, context),
              // ),
              // Column(
              //   children: [
              //     FullButton(
              //       buttonFunction: () async {
              //         await checkPath();
              //         await Provider.of<UserProvider>(context, listen: false)
              //             .setThirdPartyAuthType("LOCAL");

              //         Navigator.pushNamed(
              //             context, RouteHelper.signUpWithEmailRoute,
              //             arguments: {
              //               "isReferredUserId": widget.isReferredUserId,
              //             });
              //       },
              //       buttonText: 'Continue to mApp with Email',
              //       online: true,
              //       isIcon: true,
              //       iconAsset: 'assets/images/email.svg', height: null,
              //     ),
              //     SizedBox(
              //       height: sizer(false, 6, context),
              //     ),
              //   ],
              // ),
              // GestureDetector(
              //     onTap: () {
              //       HapticFeedback.lightImpact();
              //       showModalBottomSheet(
              //         context: context,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(sizer(true, 24, context)),
              //             topRight: Radius.circular(sizer(true, 24, context)),
              //           ),
              //         ),
              //         builder: (context) => const WhatIsMapp(
              //           yesText: "Hmm... sounds interesting",
              //           noText: "No",
              //           headerText: "What is an mApp account? 🤔",
              //           reasonText:
              //               "An mApp account is the single account you use to access all our mProducts. “mEd” is the first mProduct. More mProducts to be launched soon.",
              //         ),
              //       );
              //     },
              //     child: Text('What is an mApp account?',
              //         style: TextStyle(
              //             color: AppColors.blackColor,
              //             fontSize: sizer(true, 13, context),
              //             fontWeight: FontWeight.w500)))
          ],
          ),
        ),
      )),
    );
  }
}
