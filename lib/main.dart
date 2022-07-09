import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/view/authentication/login.dart';
import 'package:to_do/models/to_do.dart';
import 'package:to_do/view/home/home_screen.dart';
import 'package:to_do/view/onboarding/onboarding.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_do/helper/routes.dart';
import 'package:to_do/view_model/to_do_vm.dart';
import 'package:to_do/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
// import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  // runApp(MyApp(showHome: showHome));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => UserViewModel())),
      ChangeNotifierProvider(create: ((context) => TaskViewModel())),
    ],
    child: MyApp(showHome: showHome),
  ));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 217, 212, 212)));

    return MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset(
            'assets/Images/logo.jpg',
            height: 328,
            width: 328,
          ),
          backgroundColor: Colors.white,
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.leftToRight,
          splashIconSize: 390,
          nextScreen: showHome ? const LoginScreen() : const OnBoarding()),
    );
  }
}
