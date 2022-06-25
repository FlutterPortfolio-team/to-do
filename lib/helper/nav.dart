import 'package:flutter/material.dart';
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
  List<String> nav = [];

  @override
  Widget build(BuildContext context) {
    final defaultColor = context.resources.color.buttonBlue;
    final appBlueColor = context.resources.color.blueAppColor;
    int currentIndex = cInd;
    return SizedBox(
      height: 128,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: appBlueColor,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  BottomBarIcon(
                    icon: Icons.home_filled,
                    text: 'Home',
                    color: currentIndex == 0 ? defaultColor : null,
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  BottomBarIcon(
                    icon: Icons.calendar_month,
                    text: 'Calendar',
                    color: currentIndex == 1 ? defaultColor : null,
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  BottomBarIcon(
                    icon: Icons.alarm_on,
                    text: 'Focus',
                    color: currentIndex == 2 ? defaultColor : null,
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  BottomBarIcon(
                    icon: Icons.person,
                    text: 'Person',
                    color: currentIndex == 3 ? defaultColor : null,
                  ),
                ],
              ),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: defaultColor,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
            // Navigator.pushNamed(context, nav[currentIndex]);
          },
        ),
      ),
    );
  }
}
