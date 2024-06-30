import 'package:dio/dio.dart';
import '../../../../config/hive_config.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/service/coreService.dart';
import 'auth_api_service.dart';

class AuthApiServiceImp implements AuthApiService{
  @override
  Future<bool> newRegister(userModel) async {
    final _data = userModel.toJson();
    print(CoreService.baseUrl+apiRegister);
    print(userModel.toJson());
    CoreService.responsee =await CoreService.dio.post(
        CoreService.baseUrl+apiRegister,
        data: _data
    );
    final value = CoreService.responsee.data!;
    if(saveToken==true){
      userHive!.put("token", CoreService.responsee.data!['access_token']);
    }
    print(CoreService.responsee.statusCode);
    print(value);
    return true;
  }

  @override
  Future<bool> login(userModel) async {
    final _data = userModel.toJson();
    print(CoreService.baseUrl+apiLogin);
    print(userModel.toJson());
    CoreService.responsee =await CoreService.dio.post(
        CoreService.baseUrl+apiLogin,
        data: _data
    );
    final value = CoreService.responsee.data!;
    if(saveToken==true){
      userHive!.put("token", CoreService.responsee.data!['access_token']);
    }
    print(CoreService.responsee.statusCode);
    print(value);
    return true;
  }

  @override
  Future<bool> logout() async {
    print(CoreService.baseUrl+apiLogout);
    CoreService.responsee =await CoreService.dio.put(
        CoreService.baseUrl+apiLogout,
      options: Options(
        headers: {
          "Authorization": "Bearer ${userHive!.get("token")}"
        },
      ),
    );
    final value = CoreService.responsee.data!;
    print(CoreService.responsee.statusCode);
    print(value);
    return true;
  }
}