import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              onPressed: (){},
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
            drawer: Drawer(backgroundColor: lightGreen,child: IconButton(onPressed: (){context.read<AuthBloc>().add(Logout());},icon:
              BlocBuilder<AuthBloc,AuthStates>(
                builder: (context, state) {
                  if(state is loadingAuthState){
                    return CupertinoActivityIndicator(color: darkBlue,);
                  }else if(state is InitialAuthState){
                    return Icon(Icons.logout_outlined);
                  }else if(state is SuccessAuthState){
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.pushReplacementNamed(context, '/login');
                    });
                  }return SizedBox();
                },
              )
              ,)),
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
                  Container(
                    height: 450,
                     width: 400,
                     child: BlocBuilder<MangementTaskBlock,TasksStates>(
                        builder: (context, state) {
                          if(state is SuccessGetTaskState){
                            return ListView.builder(
                                itemCount: state.getTaskMosel.length,
                                itemBuilder:(context, index) {
                                 return Container(
                                   margin: EdgeInsets.only(bottom: 10,right: 270,left: 26),
                                   height: 96,
                                   decoration: BoxDecoration(
                                       color: lightPurple,
                                       borderRadius: BorderRadius.circular(10)
                                   ),
                                   child: Container(
                                     margin: EdgeInsets.only(left: 6,right: 6,top: 26,bottom: 6),
                                     padding: EdgeInsets.symmetric(horizontal: 10),
                                     decoration: BoxDecoration(
                                         color: white,
                                         borderRadius: BorderRadius.circular(10)
                                     ),
                                     child: Align(alignment:Alignment.centerLeft,child: Text(state.getTaskMosel[index].taskDescription)),
                                   ),
                                 );
                                },
                            );
                          }else if(state is ErrorProjectState){
                            return const Text(error);

                          }else{
                            return CupertinoActivityIndicator(color: lightGreen,);
                          }
                        },
                      )
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
