import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/contantsVarApp.dart';
import '../../../../../core/resource/data_state.dart';
import '../../../domain_layer/usecases/craete_project.dart';
import '../../../domain_layer/usecases/delete_project.dart';
import '../../../domain_layer/usecases/get_all_project.dart';
import '../../../domain_layer/usecases/get_project.dart';
import 'project_events.dart';
import 'project_states.dart';

class ProjectBloc extends Bloc<ProjectEvents,ProjectStates>{
  CreateProjectUseCase _createProjectUseCase;
  GetProjectUseCase _getProjectUseCase;
  DeleteProjectUseCase _deleteProjectUseCase;
  GetAllProjectUseCase _getAllProjectUseCase;

  ProjectBloc(this._createProjectUseCase,this._getProjectUseCase,this._deleteProjectUseCase,this._getAllProjectUseCase):super(InitialProjectState()){
    on<NewProject>((event, emit) async{
      emit(loadingProjectState());
      print(event.projectEntity.projectName);
      final result=await _createProjectUseCase.call(event.projectEntity);
      if(result==true){
        emit(SuccessCreateProjectState());
      }else{
        emit(ErrorProjectState());
      }
      print(result);
    });

    on<GetProject>((event, emit) async{
      emit(loadingProjectState());
      var result=await _getProjectUseCase.call(idProject!);
      if(result is SuccessState){
        emit(SuccessGetProjectState(getProjectMosel: result.getdata));
      }else{
        emit(ErrorProjectState());
      }
      print(result);
    });


    on<DeleteProject>((event, emit) async{
      emit(loadingProjectState());
      final result=await _deleteProjectUseCase.call(idProject!);
      if(result==true){
        emit(SuccessCreateProjectState());
      }else{
        emit(ErrorProjectState());
      }
      print(result);
    });

    on<GetAllProjects>((event, emit) async{
      emit(loadingProjectState());
      var result=await _getAllProjectUseCase.call("all project");
      if(result is SuccessStateList){
        emit(SuccessGetAllProjectState(getAllProjectMosel: result.getdataNew));
      }else{
        emit(ErrorProjectState());
      }
      print(result);
    });
  }
}