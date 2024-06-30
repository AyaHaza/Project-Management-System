
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/contantsVarApp.dart';
import '../../../../../core/resource/data_state.dart';
import '../../../domain_layer/usecases/add_task.dart';
import '../../../domain_layer/usecases/get_task.dart';
import 'event.dart';
import 'state.dart';

class MangementTaskBlock extends Bloc<TaskEvents,TasksStates>{
  AddTaskUseCase _addTask;
  GetTaskUseCase _getTask;
  MangementTaskBlock(this._addTask,this._getTask):super(InitialTasksStates()){
    on<NewTask>((event, emit) async{
      emit(loadingTasksStates());
      final result=await _addTask.call(event.taskModel);
      print(result);
      if(result==true){
        emit(SuccessCreateTasksStates());
      }else{
        emit(ErrorCreateTasksStates());
      }
    });

    on<GetTask>((event, emit) async{
      emit(loadingTasksStates());
      var result=await _getTask.call(idProject!);
      if(result is SuccessStateList){
        print(result.getdata);
        emit(SuccessGetTaskState(getTaskMosel:  result.getdata));
      }else{
        emit(ErrorGetTaskState());
      }
      print(result);
    });
  }
}