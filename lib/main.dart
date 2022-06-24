import 'package:flutter/material.dart';
import 'package:to_do/view/home/home_screen.dart';
import 'package:to_do/view/task/task_screen.dart';

import 'package:to_do/view/widgets/add_task_botton_sheet.dart';
import 'package:to_do/view/widgets/display_task_tile.dart';
import 'package:to_do/view/widgets/task_priority.dart';
import 'package:flutter/services.dart';
import 'package:to_do/helper/routes.dart';
import 'package:to_do/view/profile/profile_page.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 217, 212, 212)));
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
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
