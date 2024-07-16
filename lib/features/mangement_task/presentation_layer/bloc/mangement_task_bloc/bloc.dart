
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/contantsVarApp.dart';
import '../../../../../core/resource/data_state.dart';
import '../../../domain_layer/usecases/add_task.dart';
import '../../../domain_layer/usecases/edit_task_status.dart';
import '../../../domain_layer/usecases/get_task.dart';
import 'event.dart';
import 'state.dart';

class MangementTaskBlock extends Bloc<TaskEvents,TasksStates>{
  AddTaskUseCase _addTask;
  GetTaskUseCase _getTask;
  EditTaskUseCase _editTaskUseCase;
  MangementTaskBlock(this._addTask,this._getTask,this._editTaskUseCase):super(InitialTasksStates()){
    on<NewTask>((event, emit) async{
      emit(loadingTasksStates());
      final result=await _addTask.call(event.taskEntity);
      print(result);
      if(result==true){
        emit(SuccessCreateTasksStates());
      }else{
        emit(ErrorTasksStates());
      }
    });

    on<GetTask>((event, emit) async{
      emit(loadingTasksStates());
      var result=await _getTask.call(idProject!);
      if(result is SuccessStateList){
        print(result.getdataNew);
        emit(SuccessGetTaskState(getTaskMoselNew:  result.getdataNew,getTaskMoselInProgress: result.getdataInProgress!,getTaskMoselCompleted: result.getdataCompleted!));
      }else{
        emit(ErrorTasksStates());
      }
      print(result);
    });

    on<EditTaskStatus>((event, emit) async{
      final result=await _editTaskUseCase.call(event.taskModel);
      print(result);
      if(result==true){
        emit(SuccessGetTaskState(getTaskMoselNew:  taskNew,getTaskMoselInProgress: taskInProgress,getTaskMoselCompleted: taskComplet));
      }else{
        emit(ErrorTasksStates());
      }
    },);
  }
}