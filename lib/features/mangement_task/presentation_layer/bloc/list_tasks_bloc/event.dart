abstract class ListTaskEvents{}

class AddTaskToListTasks extends ListTaskEvents{
  String nameTask;
  AddTaskToListTasks({required this.nameTask});
}

class DeleteTaskFromListTasks extends ListTaskEvents{
  int nameTask;
  DeleteTaskFromListTasks({required this.nameTask});
}