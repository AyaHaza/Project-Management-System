import '../../domain_layer/repository/user_repository.dart';
import '../data_sources/auth_api_service_imp.dart';

class UserRepositoryImp implements UserRepository{
  final AuthApiServiceImp _authApiServiceImp;
  UserRepositoryImp(this._authApiServiceImp);

  @override
  Future<bool> register(userEntity) async{
    try{
      await _authApiServiceImp.newRegister(userEntity);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

  @override
  Future<bool> login(userEntity) async{
    try{
      await _authApiServiceImp.login(userEntity);
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