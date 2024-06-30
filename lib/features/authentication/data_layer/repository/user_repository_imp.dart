import '../../domain_layer/repository/user_repository.dart';
import '../data_sources/auth_api_service_imp.dart';

class UserRepositoryImp implements UserRepository{
  final AuthApiServiceImp _authApiServiceImp;
  UserRepositoryImp(this._authApiServiceImp);

  @override
  Future<bool> register(userModel) async{
    try{
      await _authApiServiceImp.newRegister(userModel);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

  @override
  Future<bool> login(userModel) async{
    try{
      await _authApiServiceImp.login(userModel);
      return true;
    }catch(e){
      print(e);
      return false;
    }

  }

  @override
  Future<bool> logout() async{
    try{
      await _authApiServiceImp.logout();
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
}