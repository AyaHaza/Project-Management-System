import '../../../../core/usecases/usecases.dart';
import '../repository/task_repository.dart';

class AddTaskUseCase extends UseCse<bool,List<dynamic>>{
  TaskRepository _taskRepository;
  AddTaskUseCase(this._taskRepository);
  @override
  Future<bool> call(params) {
    return _taskRepository.addTask(params);
  }
}