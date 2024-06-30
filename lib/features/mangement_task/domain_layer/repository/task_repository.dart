import '../../../../core/resource/data_state.dart';

abstract class TaskRepository {
  Future<bool> addTask(taskModel);
  Future<DataState> GetTask(id_project);
}