import 'package:flutter/material.dart';
import 'package:to_do/helper/routes.dart';
import 'package:to_do/res/app_context_extension.dart';
import 'package:to_do/view/widgets/bottom_bar_icon.dart';

class BottomBarNavigator extends StatefulWidget {
  int cIndex;
  BottomBarNavigator({Key? key, required this.cIndex}) : super(key: key);

  @override
  State<BottomBarNavigator> createState() => _BottomBarNavigatorState();
}

class _BottomBarNavigatorState extends State<BottomBarNavigator> {
  int get cInd => widget.cIndex;
  List<String> nav = [
    Routes.homeRoute,
    Routes.calenderRoute,
    '',
    Routes.profileRoute
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final defaultColor = context.resources.color.buttonBlue;
    final appBlueColor = context.resources.color.blueAppColor;
    int currentIndex = cInd;
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: appBlueColor,
      ),
      child: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            backgroundColor: currentIndex == 0 ? defaultColor : null,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month),
            backgroundColor: currentIndex == 1 ? defaultColor : null,
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.alarm_on),
            backgroundColor: currentIndex == 2 ? defaultColor : null,
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            backgroundColor: currentIndex == 3 ? defaultColor : null,
            label: 'Person',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: defaultColor,
        onTap: onPressed,
      ),
    );
  }

  void onPressed(int index) {
    setState(() {
      currentIndex = index;
    });
    Navigator.pushNamed(context, nav[currentIndex]);
  }
}
