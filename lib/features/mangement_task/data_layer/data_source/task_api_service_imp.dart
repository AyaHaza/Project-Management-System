import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../config/hive_config.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/resource/data_state.dart';
import '../../../../core/service/coreService.dart';
import '../models/get_task.dart';
import 'task_api_service.dart';

class TaskApiServiceImp implements TaskService{
  @override
  Future<bool> AddTask(taskModel) async{
    final _data = json.encoder.convert(taskModel);
    print(_data);
    CoreService.responsee=await CoreService.dio.post(
      CoreService.baseUrl+apiAddTask,
      data: _data,
      options: Options(
        headers: {
          "Authorization": "Bearer ${userHive!.get("token")}"
        },
      ),
    );
    final value =  CoreService.responsee.data!;
    print( CoreService.responsee.statusCode);
    print(value);
    return true;
  }

  @override
  Future<DataState> GetTask(id_project )async{
    print(CoreService.baseUrl+apiGetTask+id_project.toString());
    CoreService.responsee=await CoreService.dio.get(
      CoreService.baseUrl+apiGetTask+id_project.toString(),
      options: Options(
        headers: {
          "Authorization": "Bearer ${userHive!.get("token")}"
        },
      ),
    );
    print( CoreService.responsee.statusCode);
    if(CoreService.responsee.statusCode==200){
      var gettasks=List.generate(CoreService.responsee.data.length, (index) => GetTasktMosel.fromJson(CoreService.responsee.data[index]));
      print(gettasks);
      return SuccessStateList(getdata: gettasks);
    }else{
      return ErrorState(error: "error");
    }
  }
}