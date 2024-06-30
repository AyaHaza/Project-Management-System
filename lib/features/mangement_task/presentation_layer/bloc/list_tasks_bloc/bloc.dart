import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/constantsStringApp.dart';
import 'event.dart';
import 'state.dart';
List tasks=[];
class ListTasksBloc extends Bloc<ListTaskEvents,ListTasksStates>{

  ListTasksBloc():super(IntialListTasks(intialList: intialListText)){
    on<AddTaskToListTasks>((event, emit){
      tasks.add(event.nameTask);
      print(tasks);
      emit(addToListTasks(addToList: tasks));

    });
    on<DeleteTaskFromListTasks>((event, emit) {
      tasks.removeAt(event.nameTask);
      print(tasks);
      emit(DeletedFromListTasks(deletefromList: tasks));
    });
  }
}