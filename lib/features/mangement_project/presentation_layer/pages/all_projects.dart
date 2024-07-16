import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_management/core/constants/constantsColor.dart';
import 'package:project_management/features/mangement_project/presentation_layer/bloc/project/project_states.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../injection_container.dart';
import '../bloc/project/project_bloc.dart';
import '../bloc/project/project_events.dart';

class AllProjects extends StatelessWidget {
  const AllProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectBloc>(
        create:(context) => sl()..add(GetAllProjects()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text('All projects'),backgroundColor: lightGreen,),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: darkBlue,
              child: BlocBuilder<ProjectBloc,ProjectStates>(
                builder: (context, state) {
                  if( state is SuccessGetAllProjectState){
                    return ListView.builder(
                      itemCount: state.getAllProjectMosel.length,
                        itemBuilder: (context, index) {
                          var formatter = DateFormat('dd/MM/\nyyyy');
                          return Container(
                            width: double.infinity,
                            height: 100,
                            margin: EdgeInsets.only(top: 6,left: 12,right: 12),

                            child: Card(
                              color: lightGrey,
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration( color: lightGreen,
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(2000),topLeft:Radius.circular(10))
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 18.0,top: 10),
                                      child: Text(formatter.format(state.getAllProjectMosel[index].createDate).toString()),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 88.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Project name : ',style: TextStyle(fontSize: 10,color: lightGreen),),
                                            Text(state.getAllProjectMosel[index].name.toString(),style: TextStyle(fontSize: 10,color: lightGreen),),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Created by : ',style: TextStyle(fontSize: 10,color: lightGreen),),
                                            Text(state.getAllProjectMosel[index].createdBy.toString(),style: TextStyle(fontSize: 10,color: lightGreen),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                    );
                  }else if(state is ErrorProjectState){
                    return const Text(error);
                  }else{
                    return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
