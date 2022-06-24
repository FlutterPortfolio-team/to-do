import 'package:flutter/material.dart';
import 'package:to_do/res/app_context_extension.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: context.resources.color.buttonBlue,
        title: const Text(
          'AlertDialog Title',
          style: TextStyle(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'On of the text fields is null',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Please fill the empty text field(s)',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
