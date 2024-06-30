import '../../../../core/resource/data_state.dart';
import '../../../../core/usecases/usecases.dart';
import '../repository/project_repository.dart';

class GetProjectUseCase implements UseCse<DataState,int>{
  final ProjectRepository _projectRepository;
  GetProjectUseCase(this._projectRepository);

  @override
  Future<DataState> call( params) {
    return _projectRepository.GetProject(params);
  }

}