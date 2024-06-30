import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/widgetsApp/widget_button.dart';
import '../../../../injection_container.dart';
import '../../data_layer/models/user.dart';
import '../bloc/auth/bloc.dart';
import '../bloc/auth/event.dart';
import '../bloc/auth/state.dart';
import '../widgets/build_container_body_register.dart';
import '../widgets/build_image_widget.dart';

class Register extends StatelessWidget {
  final TextEditingController _firstName=TextEditingController();
  final TextEditingController _lastName=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _pass=TextEditingController();
  final TextEditingController _role=TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final bool value = false;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> valueNotifier=ValueNotifier(this.value);
    return BlocProvider<AuthBloc>(
      create: (context)=>sl(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: darkBlue,
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        buildContanerBody(valueNotifier,this.value,_firstName,_lastName,_email,_pass,_role),
                        buildImage(),
                      ],
                    ),
                      ButtonCustom(280, 54,
                        BlocBuilder<AuthBloc,AuthStates>(
                        builder:(context, state) {
                          if(state is InitialAuthState){
                            return const Text(signUp,style: TextStyle(fontSize: 30,color: darkBlue),);
                          }else if(state is loadingAuthState){
                            return const CupertinoActivityIndicator(color: darkBlue,);
                          }else if(state is ErrorAuthState){
                             return const Text(error,style: TextStyle(fontSize: 30,color: darkBlue),);
                          }else if(state is SuccessAuthState){
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              Navigator.pushNamed(context, '/Create&Join');
                            });
                          }return SizedBox();
                        },
                      ),lightYellow, darkBlue, () async{
                     formKey.currentState!.save();
                     UserModel user=UserModel(firstName: _firstName.text, lastName: _lastName.text, email: _email.text, password: _pass.text, role: _role.text);
                     context.read<AuthBloc>().add(NewRegister(userModel: user));
                     }
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AlreadyHaveAccount,style: TextStyle(color: white,fontSize: 14),),
                        GestureDetector(child: Text(login,style: TextStyle(color: lightGreen,fontSize: 14),),onTap: (){ Navigator.pushReplacementNamed(context, '/login');},)
                      ],
                    )
                  ]
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}


