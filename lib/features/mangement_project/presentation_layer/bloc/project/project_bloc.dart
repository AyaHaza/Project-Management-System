import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/contantsVarApp.dart';
import '../../../../../core/resource/data_state.dart';
import '../../../domain_layer/usecases/craete_project.dart';
import '../../../domain_layer/usecases/delete_project.dart';
import '../../../domain_layer/usecases/get_project.dart';
import 'project_events.dart';
import 'project_states.dart';

class ProjectBloc extends Bloc<ProjectEvents,ProjectStates>{

  CreateProjectUseCase _createProjectUseCase;
  GetProjectUseCase _getProjectUseCase;
  DeleteProjectUseCase _deleteProjectUseCase;
  ProjectBloc(this._createProjectUseCase,this._getProjectUseCase,this._deleteProjectUseCase):super(InitialProjectState()){
    on<NewProject>((event, emit) async{
      emit(loadingProjectState());
      print(event.projectModel.projectName);
      final result=await _createProjectUseCase.call(event.projectModel);
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
  }


}