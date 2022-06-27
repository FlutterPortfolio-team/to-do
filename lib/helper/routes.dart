import 'package:flutter/material.dart';
import 'package:to_do/view/home/home_screen.dart';
import 'package:to_do/view/onboarding/index.dart';
import 'package:to_do/view/widgets/calender.dart';

import '../view/authentication/login.dart';
import '../view/authentication/signup.dart';
import '../view/profile/setting_screen.dart';

class Routes {
  static const settingRoute = 'settingScreen';
  static const welcomeRoute = 'welcomeScreen';
  static const loginRoute = 'loginScreen';
  static const signupRoute = 'signupScreen';
  static const homeRoute = 'homeScreen';
    static const calenderRoute = 'calendarScreen';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
            case calenderRoute:
        return MaterialPageRoute(builder: ((context) => const AppCalender()));
      case settingRoute:
        return MaterialPageRoute(builder: ((context) => const SettingScreen()));
      case signupRoute:
        return MaterialPageRoute(builder: ((context) => const SignupScreen()));
      case loginRoute:
        return MaterialPageRoute(builder: ((context) => const LoginScreen()));
      case homeRoute:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));
      case welcomeRoute: 
      return MaterialPageRoute(builder: (context)=> const WelcomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('No route defined for ${settings.name}'),
                )));
    }
  }
}
