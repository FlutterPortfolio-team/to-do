import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/res/size_calculator.dart';
import 'package:to_do/view/onboarding/onboarding.dart';
import 'package:to_do/view/widgets/add_task_botton_sheet.dart';
import 'package:to_do/view/widgets/display_task_tile.dart';
import 'package:to_do/view/widgets/task_priority.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_do/helper/routes.dart';
import 'package:to_do/view/profile/profile_page.dart';
// import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
   final prefs = await SharedPreferences.getInstance();
   final showHome =  prefs.getBool('showHome') ?? false;
   
  runApp( MyApp(showHome : showHome));
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
      home:  AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset(
              'assets/images/logo.jpg',
              height: 328,
              width: 328,
            ),
            backgroundColor: Colors.white,
            splashTransition: SplashTransition.scaleTransition,
            pageTransitionType: PageTransitionType.leftToRight,
            splashIconSize: 390,
            nextScreen: showHome ? MyHomePage() :  OnBoarding())
      
      ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO-DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            context: context, builder: (context) => const AddTaskBottomSheet()),
      ),
      body: Center(
        child: TaskPriority(
            // button1Pressed: () => displayDialog(
            //     context,
            //     ChooseTimeWidget(
            //       onHourValueChanged: (v) => v,
            //       onMinutesValueChanged: (v) => v,
            //       onTimeValueChanged: (v) => v,
            //     )),
            ),
      ),
    );
  }
}
