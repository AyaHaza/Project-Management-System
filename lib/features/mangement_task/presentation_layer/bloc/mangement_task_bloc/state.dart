abstract class TasksStates{}

class InitialTasksStates extends TasksStates{}
class loadingTasksStates extends TasksStates{}
class SuccessCreateTasksStates extends TasksStates{}
class ErrorTasksStates extends TasksStates{}


class SuccessGetTaskState extends TasksStates{
  List<dynamic> getTaskMoselNew;
  List<dynamic> getTaskMoselInProgress;
  List<dynamic> getTaskMoselCompleted;
  SuccessGetTaskState({required this.getTaskMoselNew,required this.getTaskMoselInProgress,required this.getTaskMoselCompleted});
}

