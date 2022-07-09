import 'package:flutter/material.dart';
import 'package:to_do/helper/nav.dart';
import 'package:to_do/view/widgets/add_task_botton_sheet.dart';

class IndexScreen extends StatefulWidget {
  final Widget? body;
  final bool showBottomBar;
  const IndexScreen({Key? key, this.body, required this.showBottomBar})
      : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    const pp = 'assets/profilepic.png';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(),
          title: const Text(
            'Index',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [Image.asset(pp)],
        ),
        // drawer: const Drawer(),
        body: widget.body!,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: widget.showBottomBar
            ? FloatingActionButton(
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => const AddTaskBottomSheet()),
                backgroundColor: Colors.yellow,
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              )
            : null,
        bottomNavigationBar:
            widget.showBottomBar ? BottomBarNavigator(cIndex: 0) : null,
      ),
    );
  }
}
