import '../../../../core/usecases/usecases.dart';
import '../repository/task_repository.dart';

class AddTaskUseCase extends UseCse{
  TaskRepository _taskRepository;
  AddTaskUseCase(this._taskRepository);
  @override
  Future call(params) {
    return _taskRepository.addTask(params);
  }
}