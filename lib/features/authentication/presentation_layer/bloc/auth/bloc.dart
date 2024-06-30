import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain_layer/usecases/login.dart';
import '../../../domain_layer/usecases/logout.dart';
import '../../../domain_layer/usecases/register.dart';
import 'event.dart';
import 'state.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates>{
   RegisterUseCase _registerUseCase;
   LoginUseCase _loginUseCase;
   LogoutUseCase _logoutUseCase;
   AuthBloc(this._registerUseCase,this._loginUseCase,this._logoutUseCase):super(InitialAuthState()){
    on<NewRegister>((event, emit) async{
      emit(loadingAuthState());
      print(event.userModel.role);
      final result=await _registerUseCase.call(event.userModel);
      if(result==true){
        emit(SuccessAuthState());
      }else{
        emit(ErrorAuthState());
      }
      print(result);
    });

    on<NewLogin>((event, emit) async{
      emit(loadingAuthState());
      final result=await _loginUseCase.call(event.userModel);
      if(result==true){
        emit(SuccessAuthState());
      }else{
        emit(ErrorAuthState());
      }
      print(result);
    });

    on<Logout>((event, emit) async{
      emit(loadingAuthState());
      final result=await _logoutUseCase.call("logout");
      if(result==true){
        emit(SuccessAuthState());
      }else{
        emit(ErrorAuthState());
      }
      print(result);
    });
  }

}