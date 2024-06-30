import '../../../data_layer/models/project.dart';

abstract class ProjectEvents{}

class NewProject extends ProjectEvents{
  ProjectModel projectModel;
  NewProject({required this.projectModel});
}

class GetProject extends ProjectEvents{}

class DeleteProject extends ProjectEvents{}