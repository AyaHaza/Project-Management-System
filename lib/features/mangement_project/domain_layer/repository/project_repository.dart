import '../../../../core/resource/data_state.dart';

abstract class ProjectRepository{
  Future<bool> createProject( projectEntity);
  Future<DataState> GetProject(id_project);
  Future<bool> deleteProject( id_project);
  Future<DataState> GetAllProject();
}