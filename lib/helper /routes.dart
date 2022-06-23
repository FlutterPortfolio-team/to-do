 import 'package:flutter/material.dart';

import '../view/profile/setting_screen.dart';
 
 class Routes {
static const SettingRoute = 'settingScreen';


  static Route<dynamic>? generateRoute (RouteSettings settings) {
    switch (settings.name) {
      case SettingRoute:
        return MaterialPageRoute(builder: ((context) => const SettingScreen()));
      default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
             body: Center(
              child: Text('No route defined for ${settings.name}'),
             )
        )
       );
    }
  }
 }