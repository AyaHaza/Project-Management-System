// To parse this JSON data, do
//
//     final taskMosel = taskMoselFromJson(jsonString);

import 'dart:convert';
import '../../domain_layer/entities/task.dart';


List<TaskMosel> taskMoselFromJson(String str) => List<TaskMosel>.from(json.decode(str).map((x) => TaskMosel.fromJson(x)));

String taskMoselToJson(List<TaskMosel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskMosel extends TaskEntity{
  TaskMosel({
    required super.taskDescription,
    required super.taskStatus,
    required super.projectId,
  });

  factory TaskMosel.fromJson(Map<String, dynamic> json) => TaskMosel(
    taskDescription: json["taskDescription"],
    taskStatus: json["taskStatus"],
    projectId: json["project_id"],
  );

  Map<String, dynamic> toJson() => {
    "taskDescription": taskDescription,
    "taskStatus": taskStatus,
    "project_id": projectId,
  };
}
