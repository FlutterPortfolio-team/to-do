import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/view/authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/view/home/home_screen.dart';
import 'package:to_do/view/onboarding/onboarding.dart';
import 'package:to_do/view/widgets/add_task_botton_sheet.dart';
import 'package:to_do/view/widgets/task_priority.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_do/helper/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            nextScreen: showHome ? const LoginScreen() :  const OnBoarding())
      
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



// class MainPage extends StatelessWidget {
//   const MainPage({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Scaffold(
//        body: StreamBuilder(
        
//          stream: FirebaseAuth.instance.authStateChanges(),
//          builder: (context, snapshot) {
//           if (snapshot.hasData)  {
//            return HomeScreen();
//                 ;
//           } else {
//            return const LoginScreen();
//           }
//          }
//        ),
//     );
  
// }




// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TO-DO'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showModalBottomSheet(
//             context: context, builder: (context) => const AddTaskBottomSheet()),
//       ),
//       body: Center(
//         child: TaskPriority(
//             // button1Pressed: () => displayDialog(
//             //     context,
//             //     ChooseTimeWidget(
//             //       onHourValueChanged: (v) => v,
//             //       onMinutesValueChanged: (v) => v,
//             //       onTimeValueChanged: (v) => v,
//             //     )),
//             ),
//       ),
//     );
//   }
// }
