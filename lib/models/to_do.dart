import 'dart:convert';

class Task {
  final int userId;
  final String title;
  final String description;
  final String taskTime;
  final DateTime taskDate;
  Task({
    required this.userId,
    required this.title,
    required this.description,
    required this.taskTime,
    required this.taskDate,
  });

  Task copy({
    int? userId,
    String? title,
    String? description,
    String? taskTime,
    DateTime? taskDate,
  }) =>
      Task(
        userId: userId as int,
        title: title as String,
        description: description as String,
        taskTime: taskTime as String,
        taskDate: taskDate as DateTime,
      );

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      userId: json[TaskFields.userId],
      title: json[TaskFields.title],
      description: json[TaskFields.description],
      taskTime: json[TaskFields.taskTime],
      taskDate: DateTime.parse(json[TaskFields.taskDate] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        TaskFields.userId: userId,
        TaskFields.title: title,
        TaskFields.description: description,
        TaskFields.taskTime: taskTime,
        TaskFields.taskDate: taskDate.toIso8601String(),
      };
}

Task taskFromJson(String str) => Task.fromJson(jsonDecode(str));

String taskToJson(Task data) => jsonEncode(data.toJson());

class TaskFields {
  static const String userId = 'user_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String taskTime = 'taskTime';
  static const String taskDate = 'taskDate';
  static final List<String> values = [
    userId,
    title,
    description,
    taskTime,
    taskDate,
  ];
}
