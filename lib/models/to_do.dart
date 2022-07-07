
import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
    Task({
        required this.id,
        required this.userId,
        required this.todo,
        required this.status,
        required this.createdOn,
    });

    int id;
    int userId;
    String todo;
    int status;
    DateTime createdOn;

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        userId: json["user_id"],
        todo: json["todo"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "todo": todo,
        "status": status,
        "created_on": createdOn.toIso8601String(),
    };
}
