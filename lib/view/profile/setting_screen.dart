import 'package:flutter/material.dart';
import 'package:to_do/res/colors/general_color.dart';

import '../../components/profile/list_tile.dart';
import '../../components/profile/tile_title.dart';
import '../../res/size_calculator.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GenColors.kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings', style: TextStyle(
          fontSize: sizer(true, 16.0, context)
        ),),
        backgroundColor: GenColors.kWhiteColor,
        foregroundColor: GenColors.black,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: GenColors.kLightBlue,
            ), ),
        elevation: 0,
      ),
      body: SafeArea(
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
                    TileTile(title: 'Account'),
                    ProfileTile(
                        tileFunction: () {
                        },
                        icon: 'assets/icons/user.png',
                        text: 'Change account name'),
                ],
              ),
              )
          ],
        )),
    );
  }
}