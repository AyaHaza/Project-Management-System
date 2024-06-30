abstract class TaskEvents{}

class NewTask extends TaskEvents{
  List<dynamic> taskModel;
  NewTask({required this.taskModel});
}

class GetTask extends TaskEvents{}