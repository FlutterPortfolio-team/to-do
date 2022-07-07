import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:to_do/data/end_points.dart';
import 'package:to_do/data/network/api_end_point.dart';
import 'package:to_do/data/network/task_end_point.dart';
import 'package:to_do/models/to_do.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> tasks = [];
  final ApiEndpoint _api = ApiEndpoint();
  Future createTask({required String userId, required String todo}) async {
    final response = await _api.post(create, {
      'user_id': userId,
      'todo': todo,
    });
    final body = jsonDecode(response);
    notifyListeners();
  }

  Future getAllTask() async {
    final response = await _api.get(allTask);
    final body = jsonDecode(response);
    final Iterable json = body;
    final results = json.map((e) => Task.fromJson(e)).toList();
    print(results[0].todo);
    notifyListeners();
  }
}
