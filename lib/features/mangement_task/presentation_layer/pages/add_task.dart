import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management/features/mangement_task/data_layer/models/task.dart';
import '../../domain_layer/entities/task.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/widgetsApp/TextFiledCustom.dart';
import '../../../../core/widgetsApp/widget_button.dart';
import '../../../../injection_container.dart';

import '../bloc/list_tasks_bloc/bloc.dart';
import '../bloc/list_tasks_bloc/event.dart';
import '../bloc/list_tasks_bloc/state.dart';
import '../bloc/mangement_task_bloc/bloc.dart';
import '../bloc/mangement_task_bloc/event.dart';
import '../bloc/mangement_task_bloc/state.dart';

class AddTask extends StatelessWidget {
  final TextEditingController _nameTaskController=TextEditingController();
  final ValueNotifier<dynamic> addTasks=ValueNotifier(SizedBox());
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print(idProject);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListTasksBloc>(
          create: ( context) => ListTasksBloc(),
        ),
        BlocProvider<MangementTaskBlock>(
          create: ( context) => sl(),
        ),
      ],
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                color: darkBlue,
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Container(
                              alignment: Alignment.topLeft,
                              height: 100,
                              width: 100,
                              child: Image.asset("images/bigBear.png")
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0,top: 12),
                            child: Text(taskss,style: TextStyle(color: white,fontSize: 26,),),
                          ),
                          Center(
                            child: Container(
                              width: 400,
                              height: 618,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 618,
                                    width: 310,
                                    child:
                                      BlocBuilder<ListTasksBloc,ListTasksStates>(
                                        builder: (context, state) {
                                          if(state is IntialListTasks){
                                            return  Center(child: Text(state.intialList,style: TextStyle(color: lightYellow,fontSize: 16),));
                                          }else if(state is addToListTasks){
                                            return  ListView.builder(
                                              itemCount: state.addToList.length,
                                              itemBuilder: (context, index) {
                                                return Dismissible(
                                                  key: GlobalKey(),
                                                  onDismissed: (direction){
                                                    context.read<ListTasksBloc>().add(DeleteTaskFromListTasks(nameTask: index));
                                                  },
                                                  background: Container(
                                                    decoration: BoxDecoration(
                                                      color: red,
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),),
                                                  child: Container(
                                                    margin: EdgeInsets.only(bottom: 10),
                                                    width: 310,
                                                    height: 86,
                                                    decoration: BoxDecoration(
                                                        color: lightPurple,
                                                      borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(bottom: 10,left: 20,right: 20,top: 20),
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: white,
                                                          borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Align(alignment:Alignment.centerLeft,child: Text(state.addToList[index])),
                                                    ),
                                                  ),
                                                );
                                              },);
                                          }else if(state is DeletedFromListTasks){
                                            return   ListView.builder(
                                              itemCount: state.deletefromList.length,
                                              itemBuilder: (context, index) {
                                                return Dismissible(
                                                  key: GlobalKey(),
                                                  onDismissed: (direction){
                                                    context.read<ListTasksBloc>().add(DeleteTaskFromListTasks(nameTask: index));
                                                  },
                                                  background: Container(
                                                    decoration: BoxDecoration(
                                                        color: red,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),),
                                                  child: Container(
                                                    margin: EdgeInsets.only(bottom: 10),
                                                    width: 310,
                                                    height: 86,
                                                    decoration: BoxDecoration(
                                                        color: lightPurple,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(bottom: 10,left: 20,right: 20,top: 20),
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: white,
                                                          borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Align(alignment:Alignment.centerLeft,child: Text(state.deletefromList[index])),
                                                    ),
                                                  ),
                                                );
                                              },);
                                          }else{
                                            return CupertinoActivityIndicator();
                                          }
                                        },
                                      )
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable: addTasks,
                                    builder: (context, value, child) {
                                      return
                                      Container(
                                        margin: EdgeInsets.only(top: 40),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: white
                                        ),
                                        child: IconButton(
                                            onPressed: (){
                                              addTasks.value=showDialog(context: context, builder: (m) {
                                                return AlertDialog(
                                                  backgroundColor: lightPurple,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.circular(20) ,),
                                                  title: TextFiledCustom(10, taskDescription, white, darkBlue, 3, _nameTaskController),
                                                  actions: [
                                                    TextButton(onPressed: (){
                                                      Navigator.of(m).pop();
                                                    }, child: Text(cancel,style:TextStyle(color: darkBlue),),),
                                                    TextButton(onPressed: (){
                                                      context.read<ListTasksBloc>().add(AddTaskToListTasks(nameTask: _nameTaskController.text));
                                                      _nameTaskController.clear();
                                                      Navigator.of(m).pop();
                                                    }, child: Text(add,style:TextStyle(color: darkBlue),)),

                                                  ],
                                                );
                                              },);
                                            },
                                            icon: Icon(Icons.add,size: 26,)
                                        ),
                                      ) ;
                                     },
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: darkBlue,
                                  blurRadius: 40,
                                  spreadRadius: 8,
                                  offset: Offset(0, 4),
                                )
                              ]
                            ),
                            child: ButtonCustom(240,60,
                                BlocBuilder<MangementTaskBlock,TasksStates>(
                                  builder: (context, state) {
                                    if(state is InitialTasksStates){
                                      return const Text(createProject,style: TextStyle(fontSize: 30,color: darkBlue),);
                                    }else if(state is loadingTasksStates){
                                      return const CupertinoActivityIndicator(color: darkBlue,);
                                    }else if(state is ErrorTasksStates){
                                      return const Text("Error",style: TextStyle(fontSize: 30,color: darkBlue),);
                                    }else if(state is SuccessCreateTasksStates){
                                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                        Navigator.pushReplacementNamed(context, '/ProjectHome');
                                      });
                                    }return SizedBox();
                                  },
                                )
                                ,lightYellow,darkBlue,()async{
                                  formKey.currentState!.save();
                                  final List taskList =List.generate(tasks.length, (int index) {
                                    return TaskMosel(taskDescription: tasks[index], taskStatus: 'NEW',projectId:idProject!);
                                  });
                                  print(taskList);
                                  context.read<MangementTaskBlock>().add(NewTask(taskEntity: taskList));
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        ),

    );
  }
}
