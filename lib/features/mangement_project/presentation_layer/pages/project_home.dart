import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management/features/mangement_task/data_layer/models/task.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../injection_container.dart';
import '../../../authentication/presentation_layer/bloc/auth/bloc.dart';
import '../../../authentication/presentation_layer/bloc/auth/event.dart';
import '../../../authentication/presentation_layer/bloc/auth/state.dart';
import '../../../mangement_task/presentation_layer/bloc/mangement_task_bloc/bloc.dart';
import '../../../mangement_task/presentation_layer/bloc/mangement_task_bloc/event.dart';
import '../../../mangement_task/presentation_layer/bloc/mangement_task_bloc/state.dart';
import '../bloc/project/project_bloc.dart';
import '../bloc/project/project_events.dart';
import '../bloc/project/project_states.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class ProjectHome extends StatelessWidget {
  final ValueNotifier<dynamic> deleteProject=ValueNotifier(SizedBox());
  Color caughtColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProjectBloc>(
          create: (context) =>sl()..add(GetProject()),
        ),
        BlocProvider<MangementTaskBlock>(
          create: (context) =>sl()..add(GetTask()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) =>sl(),
        )
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (){Navigator.pushReplacementNamed(context, '/AllProjects');},
              backgroundColor: lightGreen,
              child: Icon(Icons.dataset_linked_outlined,color: darkBlue,),
            ),
            appBar: AppBar(
              centerTitle: true,
              title: Text('project name'),
              backgroundColor: lightGreen,
              actions: [
                DropdownButtonHideUnderline(
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return  ValueListenableBuilder(
                          valueListenable: deleteProject,
                          builder: (context, value, child) {
                            return DropdownButton2<String>(
                              // isExpanded: true,
                              items: options
                                  .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selected = value;
                                });print(selected);

                                if(selected=="Delete"){
                                  deleteProject.value=showDialog(context: context, builder: (m) {
                                    return AlertDialog(
                                      backgroundColor: red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:BorderRadius.circular(20) ,),
                                      title: Container(
                                        height: 140,
                                        width: 180,
                                        margin: EdgeInsets.only(top: 20),
                                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Align(alignment:Alignment.centerLeft,child: Text(sureDelete)),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 33.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  TextButton(onPressed: (){
                                                    context.read<ProjectBloc>().add(DeleteProject());
                                                  },style:TextButton.styleFrom(
                                                      backgroundColor: grey,
                                                      fixedSize: Size(90, 30),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(6))), child:
                                                  BlocProvider<ProjectBloc>(
                                                    create: (context) => sl(),
                                                    child: BlocBuilder<ProjectBloc,ProjectStates>(
                                                      builder: (context, state) {
                                                        if(state is InitialProjectState){
                                                          return Text(iAmSure,style:TextStyle(color: white),);
                                                        }else if(state is loadingProjectState){
                                                          return CupertinoActivityIndicator(color: white,);
                                                        }else if(state is SuccessDeletingProject){
                                                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                                            Navigator.pushReplacementNamed(context, '/Create&Join');
                                                          });
                                                        }return SizedBox();
                                                      },
                                                    ),
                                                  )

                                                  ),
                                                  TextButton(onPressed: (){
                                                    Navigator.of(m).pop();
                                                  }, child: Text(cancel,style:TextStyle(color: Colors.black),)),

                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),


                                    );
                                  },);
                                }
                              },

                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 90,
                                padding: const EdgeInsets.only(left: 14, right: 14),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(Icons.settings,color: darkBlue,),
                                iconSize: 22,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color:white,
                                ),
                                // offset: const Offset(-20, 0),/

                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),

                              ),
                            );
                          }
                      );
                    },
                  ),
                )

              ],
              iconTheme: IconThemeData(color:darkBlue),
            ),
            drawer: Drawer(
                backgroundColor: darkBlue,
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.only(top: 20),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset("images/bear.png",scale: 4.6,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text ("Aya Hazaa",style: TextStyle(fontSize: 15,color: white),),
                    ),
                    SizedBox(height: 30,),
                    Divider(height: 10,color: lightGreen,),
                    ListTile(
                      leading: Icon(Icons.link,color: lightGreen,),
                      title: Text("Create & Join",style: TextStyle(color: lightGreen,fontSize: 12),),
                      onTap: (){ Navigator.pushNamed(context, '/Create&Join');},
                    ),
                    ListTile(
                      leading: Icon(Icons.language_outlined,color: lightGreen,),
                      title: Text("Change Language",style: TextStyle(color: lightGreen,fontSize: 12),),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: Icon(Icons.logout_outlined,color: lightGreen,),
                      title: Text("logout",style: TextStyle(color: lightGreen,fontSize: 12),),
                      onTap: (){context.read<AuthBloc>().add(Logout());Navigator.pushReplacementNamed(context, '/login');},
                    ),
                    Divider(height: 10,color: lightGreen,),
                  ],
                )
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: darkBlue,
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    height: 280,
                    width: 360,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: lightYellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: BlocBuilder<ProjectBloc,ProjectStates>(
                      builder: (context, state) {
                        if(state is SuccessGetProjectState){
                          return Text(state.getProjectMosel.description,style: TextStyle(color: darkBlue,fontSize: 18),);
                        }else if(state is ErrorProjectState){
                          return const Text(error);
                        }else{
                          return CupertinoActivityIndicator(color: lightGreen,);
                        }
                      },
                    ),
                  ),
                    SizedBox(height: 40,),
                  Expanded(
                    child: Container(
                      width: 350,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DraggableWidget(),
                          DraggableTwoList(),
                          Container(
                            width: 116,
                            child: BlocBuilder<MangementTaskBlock,TasksStates>(
                              builder: (context, state) {
                                if(state is SuccessGetTaskState){
                                  return DragTarget(
                                    builder: (context,accepted,rejected){
                                      return  ListView.builder(
                                        itemCount: state.getTaskMoselCompleted.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 10,right: 10,left: 10),
                                            height: 96,
                                            decoration: BoxDecoration(
                                                color: green,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child:  Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                            Padding(
                                            padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 4),
                                            child: Text(done,style: TextStyle(fontSize: 12,color: greenDark),),
                                          ),
                                          Container(
                                          height: 60,
                                          margin: EdgeInsets.only(left: 6,right: 6),
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Align(alignment:Alignment.centerLeft,child: Text(state.getTaskMoselCompleted[index].taskDescription)),
                                            ),
                                        ])  );
                                        },

                                      );
                                    },
                                    onAccept: ( data){
                                      state.getTaskMoselCompleted.add(data);
                                      print(state.getTaskMoselCompleted);
                                    },
                                  );
                                }else if(state is ErrorProjectState){
                                  return const Text(error);
                                }else{
                                  return CupertinoActivityIndicator(color: darkBlue,);
                                }
                              },

                            )
                          )
                          ],
                      ),
                    ),
                  )
                ],
              )
            ),
          );
        }
      ),
    );
  }
}



class DraggableWidget extends StatefulWidget {


  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.cyan,
        width: 116,
        // margin: EdgeInsets.only(left: 20),
        child: BlocBuilder<MangementTaskBlock,TasksStates>(
          builder: (context, state) {
            if(state is SuccessGetTaskState){
              return ListView.builder(
                itemBuilder:(context, index) {
                  return Draggable(
                    data: state.getTaskMoselNew[index],
                    onDragCompleted: (){
                      idTask=state.getTaskMoselNew[index].taskId;
                      context.read<MangementTaskBlock>().add(EditTaskStatus(taskModel: TaskMosel(taskDescription: state.getTaskMoselNew[index].taskDescription, taskStatus: "IN_PROGRESS", projectId: idProject!)));
                      print(state.getTaskMoselNew[index].taskDescription);
                      state.getTaskMoselNew.removeAt(index);
                      setState(() {
                      });
                      print("object");
                      // print(state.getTaskMosel[index].taskDescription);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10,right: 2,left: 2),
                      height: 96,
                      decoration: BoxDecoration(
                          color: lightPurple,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 4),
                            child: Text(backing,style: TextStyle(fontSize: 12,color: darkPurple),),
                          ),
                          Container(
                            height: 60,
                            margin: EdgeInsets.only(left: 6,right: 6),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Align(alignment:Alignment.centerLeft,child: Text(state.getTaskMoselNew[index].taskDescription)),
                          ),
                        ],
                      ),
                    ),
                    onDraggableCanceled: (velocity, offset) {},
                    feedback: Container(
                      width: 150,
                      height: 150,
                      color: lightPurple.withOpacity(0.5),
                      child:  Center(
                        child:  Container(
                          margin: EdgeInsets.only(left: 6,right: 6,top: 26,bottom: 6),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(alignment:Alignment.centerLeft,child: Text(state.getTaskMoselNew[index].taskDescription , style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 18.0,
                          ),)),
                        ),
                      ),
                    ),

                  );
                },
                itemCount: state.getTaskMoselNew.length,
              );
            }else if(state is ErrorProjectState){
              return const Text(error);
            }else{
              return CupertinoActivityIndicator(color: darkBlue,);
            }
          },
        )
    );
  }
}


class DraggableTwoList extends StatefulWidget {
  const DraggableTwoList({Key? key}) : super(key: key);

  @override
  State<DraggableTwoList> createState() => _DraggableTwoListState();
}

class _DraggableTwoListState extends State<DraggableTwoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.cyan,
        width: 116,
        // margin: EdgeInsets.only(left: 20),
        child: BlocBuilder<MangementTaskBlock,TasksStates>(
          builder: (context, state) {
            if(state is SuccessGetTaskState){
              return DragTarget(
                builder: (context,accepted,rejected){
                  return ListView.builder(
                itemBuilder:(context, index) {
                  return  Draggable(
                          child: Container(
                          margin: EdgeInsets.only(bottom: 10,right: 10,left: 10),
                          height: 96,
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                          Padding(
                          padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 4),
                            child: Text(onprogress,style: TextStyle(fontSize: 12,color: darkRed),),
                          ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(left: 6,right: 6),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Align(alignment:Alignment.centerLeft,child: Text(state.getTaskMoselInProgress[index].taskDescription)),
                          ),
                   ]) ),
                          data: state.getTaskMoselInProgress[index],
                          onDragCompleted: (){
                            idTask=state.getTaskMoselInProgress[index].taskId;
                            context.read<MangementTaskBlock>().add(EditTaskStatus(taskModel: TaskMosel(taskDescription: state.getTaskMoselInProgress[index].taskDescription, taskStatus: "COMPLETED", projectId: idProject!)));
                            print(state.getTaskMoselInProgress[index].taskDescription);
                            state.getTaskMoselInProgress.removeAt(index);
                            setState(() {
                            });
                            print("object");
                            // print(state.getTaskMosel[index].taskDescription);
                          },
                          onDraggableCanceled: (velocity, offset) {},
                          feedback: Container(
                            width: 150,
                            height: 150,
                            color: red.withOpacity(0.5),
                            child:  Center(
                              child:  Container(
                                margin: EdgeInsets.only(left: 6,right: 6,top: 26,bottom: 6),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Align(alignment:Alignment.centerLeft,child: Text(state.getTaskMoselInProgress[index].taskDescription , style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 18.0,
                                ),)),
                              ),
                            ),
                          ),


                      );},
                    itemCount: state.getTaskMoselInProgress.length,
                  );
                },
                onAccept: ( data){
                  state.getTaskMoselInProgress.add(data);
                  print("taskNew");
                  print(state.getTaskMoselInProgress);
                },
              );
            }else if(state is ErrorProjectState){
              return const Text(error);
            }else{
              return CupertinoActivityIndicator(color: darkBlue,);
            }
          },
        )
    );

  }
}
