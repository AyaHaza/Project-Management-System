import '../../../data_layer/models/get_project.dart';

abstract class ProjectStates {}

class InitialProjectState extends ProjectStates{}
class loadingProjectState extends ProjectStates{}
class ErrorProjectState extends ProjectStates{}

class SuccessCreateProjectState extends ProjectStates{}


class SuccessGetProjectState extends ProjectStates{
  GetProjectMosel getProjectMosel;
  SuccessGetProjectState({required this.getProjectMosel});
}


class SuccessDeletingProject extends ProjectStates{
  String message;
  SuccessDeletingProject({required this.message});
}