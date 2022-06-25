import 'package:flutter/material.dart';
import 'package:to_do/view/onboarding/index.dart';

import '../view/profile/setting_screen.dart';

class Routes {
  static const settingRoute = 'settingScreen';
  static const welcomeRoute = 'welcomeScreen';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case settingRoute:
        return MaterialPageRoute(builder: ((context) => const SettingScreen()));
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
