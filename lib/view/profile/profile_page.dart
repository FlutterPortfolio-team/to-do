import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do/components/dialogs/button/full_button.dart';
import 'package:to_do/components/profile/list_tile.dart';
import 'package:to_do/components/profile/tile_title.dart';
import 'package:to_do/res/colors/general_color.dart';
import 'package:to_do/res/size_calculator.dart';

import '../../components/dialogs/change_name_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


 
  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPress() async {
      bool goBack = false;
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('Exit From The App'),
            actions: [
              TextButton(
                onPressed: () {
                  goBack = false;
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  goBack = true;
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
      );
      return goBack;
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: sizer(true, 24.0, context),
                    right: sizer(true, 24.0, context),
                    top: sizer(false, 13.0, context),
                    bottom: 56.0),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Profile',
                        style:
                            TextStyle(fontSize: 20.0, color: GenColors.black),
                      ),
                    ),
                    SizedBox(
                      height: sizer(false, 24.0, context),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Images/habeeb.JPG'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                        shape: BoxShape.circle,
                      ),
                      width: 100,
                      height: 100,
                      // child: Image.asset('assets/Images/habeeb.JPG'),
                    ),
                    SizedBox(
                      height: sizer(false, 10.0, context),
                    ),
                    const Text(
                      'Martha Hays',
                      style: TextStyle(
                          fontSize: 20.0, color: GenColors.black, height: 1.5),
                    ),
                    SizedBox(
                      height: sizer(true, 20.0, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FullButton(
                          buttonFunction: () {},
                          height: 58.0,
                          width: 154,
                          buttonText: '10 Task left',
                        ),
                        FullButton(
                          buttonFunction: () {},
                          height: 58.0,
                          width: 154,
                          buttonText: '5 Task done',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizer(false, 32.0, context),
                    ),
                    const TileTile(title: 'Settings'),
                    ProfileTile(
                      tileFunction: (){
                          HapticFeedback.lightImpact();
                         Navigator.of(context).pushNamed('settingScreen');
                      }

                        ,
                        icon: 'assets/icons/setting.png',
                        text: 'App settings'),
                    SizedBox(
                      height: sizer(false, 16.0, context),
                    ),
                    const TileTile(title: 'Account'),
                    ProfileTile(
                        tileFunction: () {
                          displayAlert(context: context, title: 'change name account', content: 'martha hays');
                        },
                        icon: 'assets/icons/user.png',
                        text: 'Change account name'),
                    ProfileTile(
                        tileFunction: () {
                          _onBackPress;
                        },
                        icon: 'assets/icons/key.png',
                        text: 'Change account password'),
                    ProfileTile(
                        tileFunction: () {},
                        icon: 'assets/icons/camera.png',
                        text: 'Change account image'),
                    SizedBox(
                      height: sizer(false, 16.0, context),
                    ),
                    const TileTile(title: 'Uptodo'),
                    ProfileTile(
                        tileFunction: () {},
                        icon: 'assets/icons/menu.png',
                        text: 'About US'),
                    ProfileTile(
                        tileFunction: () {},
                        icon: 'assets/icons/info-circle.png',
                        text: 'FAQ'),
                    ProfileTile(
                        tileFunction: () {},
                        icon: 'assets/icons/flash.png',
                        text: 'Help & Feedback'),
                    ProfileTile(
                        tileFunction: () {},
                        icon: 'assets/icons/like.png',
                        text: 'Support US'),
                    SizedBox(
                      height: sizer(false, 16.0, context),
                    ),
                    ProfileTile(
                        tileFunction: () {},
                        tailColor: Colors.transparent,
                        icon: 'assets/icons/logout.png',
                        textColor: Colors.red,
                        iconColor: Colors.red,
                        text: 'Log out'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
