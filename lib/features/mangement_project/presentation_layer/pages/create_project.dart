import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/widgetsApp/TextFiledCustom.dart';
import '../../../../core/widgetsApp/widget_button.dart';
import '../../../../injection_container.dart';
import '../../data_layer/models/project.dart';
import '../bloc/project/project_bloc.dart';
import '../bloc/project/project_events.dart';
import '../bloc/project/project_states.dart';

class CreateProject extends StatelessWidget {
final TextEditingController _projectNameController=TextEditingController();
final TextEditingController _projectScriptController=TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectBloc>(
        create: (context) =>sl(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: darkBlue,
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 10,),
                    Container(
                        alignment: Alignment.topLeft,
                        height: 100,
                        width: 100,
                        child: Image.asset("images/bigBear.png")
                    ),
                    TextFiledCustom(30,projectName,white ,white,2,_projectNameController),
                    const SizedBox(height: 50,),
                    TextFiledCustom(30,projectScript,white,white,28,_projectScriptController),
                    ButtonCustom(290,60,
                        BlocBuilder<ProjectBloc,ProjectStates>(
                            builder: (context, state) {
                              if(state is InitialProjectState){
                                return const Text(createProject,style: TextStyle(fontSize: 30,color: darkBlue),);
                              }else if(state is loadingProjectState){
                                return const CupertinoActivityIndicator(color: darkBlue,);
                              }else if(state is ErrorProjectState){
                                return const Text("Error",style: TextStyle(fontSize: 30,color: darkBlue),);
                              }else if(state is SuccessCreateProjectState){
                                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                  Navigator.pushReplacementNamed(context, '/AddTask');
                                });
                              }return SizedBox();
                            },
                        )
                        ,lightYellow,darkBlue,()async{
                          formKey.currentState!.save();
                          ProjectModel createProject=ProjectModel(projectName:_projectNameController.text ,projectDescription:_projectScriptController.text ,projectStatus: "");
                          context.read<ProjectBloc>().add(NewProject(projectModel: createProject));
                        })
                  ],
                ),
              ),
            ),
          );
        }
      )
    );
  }
}
