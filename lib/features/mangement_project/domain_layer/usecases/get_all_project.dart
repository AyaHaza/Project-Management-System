import '../../../../core/resource/data_state.dart';
import '../../../../core/usecases/usecases.dart';
import '../repository/project_repository.dart';

class GetAllProjectUseCase implements UseCse<DataState,String>{
  final ProjectRepository _projectRepository;
  GetAllProjectUseCase(this._projectRepository);

  @override
  Future<DataState> call( params) {
    return _projectRepository.GetAllProject();
  }

}