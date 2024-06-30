import '../../../../core/resource/data_state.dart';

abstract class ProjectRepository{
  Future<bool> createProject( projectModel);
  Future<DataState> GetProject(id_project);
  Future<bool> deleteProject( id_project);
}