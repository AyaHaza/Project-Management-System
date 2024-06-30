import '../../../../core/usecases/usecases.dart';
import '../repository/task_repository.dart';

class GetTaskUseCase extends UseCse{
  TaskRepository _taskRepository;
  GetTaskUseCase(this._taskRepository);
  @override
  Future call(params) {
    return _taskRepository.GetTask(params);
  }
}