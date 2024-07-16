import '../../../../core/resource/data_state.dart';

abstract class TaskRepository {
  Future<bool> addTask(taskEntity);
  Future<DataState> GetTask(id_project);
  Future<bool> EditTasStatus(taskEntity);
}