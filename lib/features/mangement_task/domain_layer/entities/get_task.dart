
class GetTasktEntity {
  int taskId;
  String taskDescription;
  String taskStatus;
  bool hasBugs;
  List<dynamic> bugs;
  int taskProject;
  DateTime taskCreateDate;
  dynamic taskUpdateDate;
  int taskCreatedBy;
  dynamic taskUpdatedBy;

  GetTasktEntity({
    required this.taskId,
    required this.taskDescription,
    required this.taskStatus,
    required this.hasBugs,
    required this.bugs,
    required this.taskProject,
    required this.taskCreateDate,
    required this.taskUpdateDate,
    required this.taskCreatedBy,
    required this.taskUpdatedBy,
  });

}
