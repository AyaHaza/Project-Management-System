abstract class TasksStates{}

class InitialTasksStates extends TasksStates{}
class loadingTasksStates extends TasksStates{}
class SuccessCreateTasksStates extends TasksStates{}
class ErrorCreateTasksStates extends TasksStates{}


class SuccessGetTaskState extends TasksStates{
  List<dynamic> getTaskMosel;
  SuccessGetTaskState({required this.getTaskMosel});
}
class ErrorGetTaskState extends TasksStates{}