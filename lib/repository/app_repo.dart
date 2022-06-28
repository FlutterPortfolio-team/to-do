import 'package:to_do/models/to_do.dart';
import 'package:to_do/models/user.dart';

import 'package:http/http.dart' as http;

abstract class UserRepo {
  Future<User?> getUser();
  Future<AllUser?> getAllUser();
  Future<User?> registerUser();
  Future<User?> signInUser();
  Future<http.Response> updateUser();
}

abstract class TaskRepo {
  Future<Task?> getTask();
  Future<Task?> filterTask();
  // Future<AllTask> getAllTask();
  Future<Task?> createTask();
  Future<http.Response> updateTask();
  Future<http.Response> deleteTask();
}
