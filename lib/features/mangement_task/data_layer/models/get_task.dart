import 'dart:convert';
import '../../domain_layer/entities/get_task.dart';

List<GetTasktMosel> getTasktMoselFromJson(String str) => List<GetTasktMosel>.from(json.decode(str).map((x) => GetTasktMosel.fromJson(x)));

String getTasktMoselToJson(List<GetTasktMosel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetTasktMosel extends GetTasktEntity {

  GetTasktMosel({
    required super.taskId,
    required super.taskDescription,
    required super.taskStatus,
    required super.hasBugs,
    required super.bugs,
    required super.taskProject,
    required super.taskCreateDate,
    required super.taskUpdateDate,
    required super.taskCreatedBy,
    required super.taskUpdatedBy,
  });

  factory GetTasktMosel.fromJson(Map<String, dynamic> json) => GetTasktMosel(
    taskId: json["taskId"],
    taskDescription: json["taskDescription"],
    taskStatus: json["taskStatus"],
    hasBugs: json["hasBugs"],
    bugs: List<dynamic>.from(json["bugs"].map((x) => x)),
    taskProject: json["taskProject"],
    taskCreateDate: DateTime.parse(json["taskCreateDate"]),
    taskUpdateDate: json["taskUpdateDate"],
    taskCreatedBy: json["taskCreatedBy"],
    taskUpdatedBy: json["taskUpdatedBy"],
  );

  Map<String, dynamic> toJson() => {
    "taskId": taskId,
    "taskDescription": taskDescription,
    "taskStatus": taskStatus,
    "hasBugs": hasBugs,
    "bugs": List<dynamic>.from(bugs.map((x) => x)),
    "taskProject": taskProject,
    "taskCreateDate": taskCreateDate.toIso8601String(),
    "taskUpdateDate": taskUpdateDate,
    "taskCreatedBy": taskCreatedBy,
    "taskUpdatedBy": taskUpdatedBy,
  };
}
