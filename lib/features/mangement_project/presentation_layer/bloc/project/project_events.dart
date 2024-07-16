import '../../../domain_layer/entities/project.dart';

abstract class ProjectEvents{}

class NewProject extends ProjectEvents{
  ProjectEntity projectEntity;
  NewProject({required this.projectEntity});
}

class GetProject extends ProjectEvents{}

class DeleteProject extends ProjectEvents{}

class GetAllProjects extends ProjectEvents{}