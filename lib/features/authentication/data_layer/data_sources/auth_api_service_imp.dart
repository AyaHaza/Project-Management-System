import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../config/hive_config.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/service/coreService.dart';
import '../models/user.dart';
import 'auth_api_service.dart';

class AuthApiServiceImp implements AuthApiService{
  @override
  Future<bool> newRegister(userEntity) async {
    print(CoreService.baseUrl+apiRegister);
    final _data = jsonEncode(UserModel.fromJson(userEntity));
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
  Future<bool> login(userEntity) async {
    print(CoreService.baseUrl+apiLogin);
    final _data = jsonEncode(UserModel.fromJson(userEntity));
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