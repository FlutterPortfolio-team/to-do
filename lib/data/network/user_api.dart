import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/helper/routes.dart';
import 'package:to_do/models/user.dart';

import 'package:http/http.dart' as http;
String baseURL = 'https://todo22a.herokuapp.com/api/v1/user';

Future<dynamic> getALlUser() async {
  final response =
      await http.get(Uri.parse(baseURL));
  if (response.statusCode == 200) {
    // return UserList.fromJson(jsonDecode(response.body));
    return jsonDecode(response.body);
  } else {
    // debugPrint(response.body.toString());
    throw Exception(response.body);
  }
}

Future<dynamic> getUser() async {
  final response =
      await http.get(Uri.parse('$baseURL/4'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    // debugPrint(response.body.toString());
    throw Exception(response.body);
  }
}

Future<void> createUser(
    {required String userName,
    required String email,
    required String password,
    required BuildContext context}) async {
  String url = '$baseURL/register';
  Uri uri = Uri.parse(url);
  try {
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": userName,
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        msg: 'Sign Up successful!! ',
      );
      Navigator.of(context).pushNamed(Routes.loginRoute);
    } else {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        msg: 'Sign Up failed!! ',
      );
    }
  } catch (e) {
    Fluttertoast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      msg: e.toString(),
    );
  }
}

Future<void> signInUser({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  String url = '$baseURL/login';
  Uri uri = Uri.parse(url);
  try {
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      Navigator.of(context).pushNamed(Routes.homeRoute);
    }else {
      Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        msg: 'Login failed!! ',
      );
    }
  } catch (e) {
    Fluttertoast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      msg: e.toString(),
    );
  }
}

Future<http.Response> updateUser(User user) async {
  String url = '$baseURL/4';
  Uri uri = Uri.parse(url);
  final response = await http.put(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: userToJson(user),
  );

  return response;
}
