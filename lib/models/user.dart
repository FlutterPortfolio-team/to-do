import 'dart:convert';

class AllUser {
  final List<User> users;
  AllUser({required this.users});
  factory AllUser.fromJson(Map<String, dynamic> json) =>
      AllUser(users: json['user']);
}

class User {
  final String userName;
  final String email;
  final String password;
  User({
    required this.userName,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, String> json) => User(
        userName: json['userName'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
      );

  Map<String, String> toJson() => {
        'userName': userName,
        'email': email,
        'password': password,
      };
}

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User user) {
  final data = userToJson(user);
  return data;
}
