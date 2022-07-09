import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/models/to_do.dart';
import 'package:to_do/repository/authentication_repository.dart';
import 'package:to_do/repository/todo_repo.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> tasks = [];
  final TodoRepo _api = TodoRepo();
  bool loading = false;

  Future createTask(String todo) async {
    loading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('id');
    final response = await _api.createTask(
      userId.toString(),
      todo,
    );
    if (response == null) {
      loading = false;
      notifyListeners();
      customToast('Couldn\'t create a todo');
    } else {
      customToast('Successfully created a todo');
    }
    notifyListeners();
  }

  getTaskByUser() async {
    loading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('id');
    final response = await _api.getTaskByUser(userId!);
    tasks = response;
    final encodedData = Task.encode(tasks);
    await prefs.setString('tasks', encodedData);
  }

  Future get tasksOfUser async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    return prefs.getString('tasks');
  }

  getTaskById() async {
    loading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final taskId = prefs.getString('taskId');
    final response = await _api.getTaskById(taskId! as int);
    if (response == null) {
      loading = false;
    }
  }

  deleteTask(int taskId) async {
    final response = await _api.deleteTaskById(taskId);
    if (response == null) {
      loading = false;
      customToast('Error');
      notifyListeners();
    } else {
      customToast('Task was deleted succefully');
      notifyListeners();
    }
  }

  updateTask(int taskId, String todo) async {
    final response = await _api.updateTask(taskId, todo);
    if (response == null) {
      loading = false;
      customToast('Couldn\'t update task');
      notifyListeners();
    } else {
      customToast('Task was updated succefully');
      notifyListeners();
    }
  }
  // Future getAllTask() async {
  //   final response = await _api.get(allTask);
  //   final body = jsonDecode(response);
  //   final Iterable json = body;
  //   final results = json.map((e) => Task.fromJson(e)).toList();
  //   print(results[0].todo);
  //   notifyListeners();
  // }
}
