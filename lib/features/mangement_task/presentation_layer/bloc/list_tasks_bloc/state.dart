abstract class ListTasksStates{}

class IntialListTasks extends ListTasksStates{
  String intialList;
  IntialListTasks({required this.intialList});
}

class addToListTasks extends ListTasksStates{
  List addToList;
  addToListTasks({required this.addToList});
}

class DeletedFromListTasks extends ListTasksStates{
  List deletefromList;
  DeletedFromListTasks({required this.deletefromList});
}