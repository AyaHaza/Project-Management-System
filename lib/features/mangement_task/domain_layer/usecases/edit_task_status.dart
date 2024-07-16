import '../../../../core/usecases/usecases.dart';
import '../repository/task_repository.dart';

class EditTaskUseCase extends UseCse{
  TaskRepository _taskRepository;
  EditTaskUseCase(this._taskRepository);
  @override
  Future call(params) {
    return _taskRepository.EditTasStatus(params);
  }
}