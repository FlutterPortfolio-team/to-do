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
    child: const App(),
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
          nextScreen: showHome ? const HomeScreen() : const OnBoarding()),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Users API Example',
      home: UserScreen(),
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreen createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserViewModel>(context, listen: false);
    final task = Provider.of<TaskViewModel>(context, listen: false);
    task.getAllTask();
    //  user.createUser(username: 'asdaddssdas', email: 'asdaddssdas', password: 'password');
    user.signInUser('email', 'password');
    user.getAllUsers();
    // user.signInUser('lmao', 'password');
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskViewModel>(context, listen: false);
    task.createTask(userId: '4', todo: 'get ur hands dirty');
    final vm = Provider.of<UserViewModel>(context);
    // UserModel user = vm.signInUser('email1234567890@gmai.com', 'password');

    // vm.updateUser(
    //     username: 'username',
    //     email: 'email',
    //     password: 'password',
    //     );
    // Provider.of<UserViewModel>(context, listen: false)
    //     .signInUser('lmao', 'password');
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserList API Example'),
      ),
      body: UsersWidget(users: vm.users),
    );
  }
}

class UsersWidget extends StatelessWidget {
  final List<UserModel> users;
  const UsersWidget({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          debugPrint('///---///---///            ---///---///---///');
          debugPrint(user.toString());
          debugPrint('///---///---///            ---///---///---///');
          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              width: 50,
              height: 100,
            ),
            title: Text(user.userName),
          );
        },
      ),
    );
  }
}
