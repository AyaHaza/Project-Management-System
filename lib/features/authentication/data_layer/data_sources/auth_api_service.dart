import '../../../../core/service/coreService.dart';

abstract class AuthApiService extends CoreService{
  Future<bool> newRegister(userModel);
  Future<bool> login(userModel);
  Future<bool> logout();
}