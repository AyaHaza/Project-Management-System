import 'package:project_management/features/mangement_task/data_layer/models/task.dart';
import 'package:project_management/features/mangement_task/domain_layer/entities/task.dart';

abstract class TaskEvents{}

class NewTask extends TaskEvents{
  List<dynamic> taskEntity;
  NewTask({required this.taskEntity});
}

class GetTask extends TaskEvents{}

class EditTaskStatus extends TaskEvents{
  TaskMosel taskModel;
  EditTaskStatus({required this.taskModel});
}