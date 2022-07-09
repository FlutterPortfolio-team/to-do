import 'dart:convert';

import 'package:to_do/view_model/user_view_model.dart';

UserModel userModelFromJson(String str) => UserModel(user: userFromJson(str));
User userFromJson(String str) => User.fromJson(json.decode(str));

// List<User> userListFromJson(String str) =>
//     List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(User data) => json.encode(data.toJson());

// String userListToJson(List<User> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.password,
  });

  int? id;
  String? username;
  String? email;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"] == null ? null : json['username'],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
      };
}

class UserList {
  final List<User> users;
  UserList({required this.users});

  factory UserList.fromJson(List<dynamic> json) {
    List<User> users = [];
    users = json.map((e) => User.fromJson(e)).toList();

    return UserList(users: users);
  }
}
