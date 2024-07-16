import '../../../../core/service/coreService.dart';

abstract class AuthApiService extends CoreService{
  Future<bool> newRegister(userEntity);
  Future<bool> login(userEntity);
  Future<bool> logout();
}