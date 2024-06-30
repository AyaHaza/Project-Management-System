import '../../../../core/usecases/usecases.dart';
import '../../data_layer/models/project.dart';
import '../repository/project_repository.dart';

class CreateProjectUseCase implements UseCse<bool,ProjectModel>{
  final ProjectRepository _projectRepository;
  CreateProjectUseCase(this._projectRepository);

  @override
  Future<bool> call( params) {
    return _projectRepository.createProject(params);
  }

}