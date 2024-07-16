import '../../../../core/resource/data_state.dart';
import '../../../../core/service/coreService.dart';

abstract class ProjectApiService extends CoreService {
  Future<bool> createProjectService(projectEntity);
  Future<DataState> GetProjectService(id_project);
  Future<bool> deleteProjectService(id_project);
  Future<DataState> GetAllProjectService();

}
