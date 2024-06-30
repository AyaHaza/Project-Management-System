import '../../../../core/resource/data_state.dart';
import '../../../../core/service/coreService.dart';

abstract class TaskService extends CoreService{
  Future<bool>AddTask(taskModel);
  Future<DataState> GetTask(id_project);

}