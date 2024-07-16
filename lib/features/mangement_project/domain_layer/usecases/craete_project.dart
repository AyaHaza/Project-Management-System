import '../../../../core/usecases/usecases.dart';
import '../entities/project.dart';
import '../repository/project_repository.dart';

class CreateProjectUseCase implements UseCse<bool,ProjectEntity>{
  final ProjectRepository _projectRepository;
  CreateProjectUseCase(this._projectRepository);

  @override
  Future<bool> call( params) {
    return _projectRepository.createProject(params);
  }

}