import '../../../../core/resource/data_state.dart';
import '../../domain_layer/repository/task_repository.dart';
import '../data_source/task_api_service_imp.dart';

class TaskRepositoryImp implements TaskRepository{
  TaskApiServiceImp _taskApiServiceImp;
  TaskRepositoryImp( this._taskApiServiceImp);
  @override
  Future<bool> addTask(taskEntity) async{
    try{
     await _taskApiServiceImp.AddTask(taskEntity);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

  @override
  Future<DataState> GetTask(id_project) async{
    try{
      var dataState=await _taskApiServiceImp.GetTask(id_project);
      print(dataState);
      return dataState;
    }catch(e){
      print(e);
      return ErrorState(error: "error");
    }

  }

  @override
  Future<bool> EditTasStatus(taskEntity)async {
    try{
      await _taskApiServiceImp.EditTasStatus(taskEntity);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
}