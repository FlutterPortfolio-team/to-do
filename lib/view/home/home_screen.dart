import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/view/widgets/add_task_botton_sheet.dart';
import 'package:to_do/view_model/to_do_vm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskViewModel>(context, listen: false);
    // task.createTask('get ur hands reneat');
    task.getTaskByUser();
    const pp = 'assets/profilepic.png';
    const boy = 'assets/rafki.png';
    return SafeArea(
      child: Scaffold(
        //  resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Index',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [Image.asset(pp)],
        ),
        drawer: const Drawer(),
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Image.asset(boy),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'What do you want to do today?',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      const Text('Tap + to add your tasks')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: FloatingActionButton(
            onPressed: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const AddTaskBottomSheet()),
            backgroundColor: Colors.yellow,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
        // bottomNavigationBar: BottomBarNavigator(cIndex: 0),
      ),
    );
  }
}
