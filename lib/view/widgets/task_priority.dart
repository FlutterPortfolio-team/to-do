import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';
import 'package:to_do/view/widgets/small_container.dart';

class TaskPriority extends StatelessWidget {
  TaskPriority({Key? key}) : super(key: key);
  List<SmallContainer> choices = <SmallContainer>[
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text(
            '1',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text('2', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text('3', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text('4', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text('5', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text('6', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text('7', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text('8', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text('9', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    SmallContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/Images/flag.png'),
          Text('10', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return PopUpContainer(
        height: 450.0,
        title: 'Task Priority',
        body: SizedBox(
          height: 250,
          child: GridView.count(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            crossAxisCount: 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            children: choices,
          ),
        ),
        showDivider: true,
        setTodefault: false);
  }
}
