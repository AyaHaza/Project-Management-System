import '../../../../core/resource/data_state.dart';
import '../../../../core/service/coreService.dart';

abstract class TaskService extends CoreService{
  Future<bool>AddTask(taskEntity);
  Future<DataState> GetTask(id_project);
  Future<bool> EditTasStatus(taskEntity);

}