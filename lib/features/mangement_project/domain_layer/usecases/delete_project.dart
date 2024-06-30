import '../../../../core/usecases/usecases.dart';
import '../repository/project_repository.dart';

class DeleteProjectUseCase implements UseCse<bool,int>{
  final ProjectRepository _projectRepository;
  DeleteProjectUseCase(this._projectRepository);

  @override
  Future<bool> call( params) {
    return _projectRepository.deleteProject(params);
  }

}