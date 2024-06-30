import '../../../../core/resource/data_state.dart';
import '../../domain_layer/repository/project_repository.dart';
import '../data_source/project_api_service_imp.dart';

class ProjectRepositoryImp implements ProjectRepository{
  final ProjectApiServiceImp _projectApiServiceImp;
  ProjectRepositoryImp(this._projectApiServiceImp);
  @override
  Future<bool> createProject(projectModel) async{
    try{
      await _projectApiServiceImp.createProjectService(projectModel);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

  @override
  Future<DataState> GetProject(id_project) async{
    try{
      var dataState=await _projectApiServiceImp.GetProjectService(id_project);
        return dataState;
    }catch(e){
      print(e);
      return ErrorState(error: "error");
    }

  }

  @override
  Future<bool> deleteProject(id_project) async{
    try{
      await _projectApiServiceImp.deleteProjectService(id_project);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

}