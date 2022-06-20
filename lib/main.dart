import 'package:flutter/material.dart';
import 'package:to_do/res/app_context_extension.dart';
import 'package:to_do/utils/display_dialog.dart';
import 'package:to_do/view/widgets/add_task_botton_sheet.dart';
import 'package:to_do/view/widgets/add_task_widget.dart';
import 'package:to_do/view/widgets/app_bottom_sheet.dart';
import 'package:to_do/view/widgets/calender.dart';
import 'package:to_do/view/widgets/choose_time_widget.dart';
import 'package:to_do/view/widgets/task_priority.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
