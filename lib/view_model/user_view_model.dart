import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/data/end_points.dart';
import 'package:to_do/data/network/api_end_point.dart';
import 'package:to_do/models/user.dart';

class UserModel {
  final User user;
  UserModel({required this.user});

  int get id => user.id!;

  String get userName => user.username ?? 'nil';

  String get email => user.email ?? 'nil';

  String get password => user.password ?? 'nil';
}

class UserViewModel extends ChangeNotifier {
  List<UserModel> users = [];
  late UserModel user;

  Future<User> createUser(
      {required String username,
      required String email,
      required String password}) async {
    final response = await ApiEndpoint().post(signUp, {
      'username': username,
      'email': email,
      'password': password,
    });
    final body = userFromJson(response);
    if (jsonDecode(response)['code'] == 'ER_DUP_ENTRY') {
      throw Exception('User Alreay Exists');
    }
    user = UserModel(user: body);
    notifyListeners();
    return body;
  }

  Future<void> getAllUsers() async {
    final response = await ApiEndpoint().get(allUsers);
    final body = jsonDecode(response);
    final Iterable json = body;
    final results = json.map((e) => User.fromJson(e)).toList();
    users = results.map((user) => UserModel(user: user)).toList();
    notifyListeners();
  }

  Future<UserModel?> signInUser(String email, String password) async {
    final response = await ApiEndpoint().post(signIn, {
      'email': email,
      'password': password,
    });
    // print(userModelFromJson(response).email.toString());
    // user = UserModel(user: User.fromJson(json.decode(response)));
    final body = jsonDecode(response);
    if (body['status'] != true) {
      throw Exception('User does not exist');
    }
    final userResonse = body['data'];
    user = UserModel(
        user: User(
            id: userResonse['id'],
            username: userResonse['username'],
            email: email,
            password: userResonse['password']));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', user.id);
    notifyListeners();
    return user;
  }

  Future<UserModel?> updateUser({
    required String username,
    required String email,
    required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id');
    final response = await ApiEndpoint().put('$update +${id.toString()}', {
      'username': username,
      'email': email,
      'password': password,
    });
    final body = userFromJson(response);
    if (jsonDecode(response)['code'] == 'ER_DUP_ENTRY') {
      throw Exception('User Alreay Exists');
    }
    // final userResonse = body['data'];

    user = UserModel(
        user: User(
            id: body.id,
            username: body.username,
            email: email,
            password: body.password));
    notifyListeners();
    return user;
  }
}
