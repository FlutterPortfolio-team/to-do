import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:to_do/res/colors/general_color.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
      context: _context,
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.3),
      builder: (context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: _FullScreenLoader());
      },
    );
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //  decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0)),
        child: Center(
            child: Platform.isIOS
                ? const CupertinoActivityIndicator()
                // : SpinKitRing(
                //     color: redColor,
                //     size: 50.0,
                //     duration: Duration(milliseconds: 500),
                //   )
                : const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(GenColors.kBlue),
                  )));
  }
}
