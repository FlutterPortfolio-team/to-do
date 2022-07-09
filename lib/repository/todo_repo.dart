import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/data/end_points.dart';
import 'package:to_do/data/network/api_end_point.dart';
import 'package:to_do/models/to_do.dart';

class TodoRepo {
  final ApiEndpoint _api = ApiEndpoint();

  Future createTask(String userId, String todo) async {
    try {
      final response = await _api.post(cTask, {
        'user_id': userId,
        'todo': todo,
      });
      final body = jsonDecode(response);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('taskId', body['user_id']);
      return body;
    } catch (err) {
      log(err.toString());
      return null;
    }
  }

  Future getTaskByUser(int userId) async {
    try {
      final responses = await _api.get('$taskByUser+$userId');
      if (responses != null) {
        final body = jsonDecode(responses);
        final Iterable json = body;
        final result = json.map((e) => Task.fromJson(e)).toList();
        return result;
      }
    } catch (err) {
      log(err.toString());
      return null;
    }
  }

  Future getTaskById(int taskId) async {
    try {
      final response = await _api.get('$taskById+$taskId');
      if (response['message'] == 'Not found User with id $taskId.') {
        return null;
      } else {
        return response;
      }
    } catch (err) {
      log(err.toString());
      return null;
    }
  }

  Future deleteTaskById(int taskId) async {
    try {
      final response = await _api.customDelete('$deleteTask+$taskId');
      return response;
    } catch (err) {
      log(err.toString());
      return null;
    }
  }

  Future updateTask(int taskId, String todo) async {
    try {
      final response = await _api.put('$editTask+$taskId', {'todo': todo});
      return response;
    } catch (err) {
      log(err.toString());
      return null;
    }
  }
}
