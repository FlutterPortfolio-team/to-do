import 'dart:convert';

List<Task> taskListFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskListToJson(List<Task> data) =>
    json.encode(List<dynamic>.from(data.map((x) => Task.toJson(x))));

    Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(Task.toJson(data));

class Task {
  Task({
    required this.id,
    required this.userId,
    required this.todo,
    required this.status,
    required this.createdOn,
  });

  int? id;
  int? userId;
  String? todo;
  int? status;
  DateTime createdOn;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        userId: json["user_id"],
        todo: json["todo"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
      );

  static Map<String, dynamic> toJson(Task task) => {
        "id": task.id,
        "user_id": task.userId,
        "todo": task.todo,
        "status": task.status,
        "created_on": task.createdOn.toIso8601String(),
      };
  static String encode(List<Task> tasks) => json.encode(
        tasks.map<Map<String, dynamic>>((task) => Task.toJson(task)).toList(),
      );
  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<Task>((e) => Task.fromJson(e))
          .toList();
}

// class TaskList {
//   final List<Task> tasks;
//   TaskList({required this.tasks});

//   factory TaskList.fromJson(List<dynamic> json) {
//     List<Task> tasks = [];
//     tasks = json.map((e) => Task.fromJson(e)).toList();
//     return TaskList(tasks: tasks);
//   }
// }
