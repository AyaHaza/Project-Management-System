import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../config/hive_config.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/resource/data_state.dart';
import '../../../../core/service/coreService.dart';
import '../models/get_project.dart';
import '../models/project.dart';
import 'project_api_service.dart';

class ProjectApiServiceImp implements ProjectApiService {
  @override
  Future<bool> createProjectService(projectEntity) async{
    final _data = jsonEncode(ProjectModel.fromJson(projectEntity));
    print(CoreService.baseUrl+apiCreateProject);
    CoreService.responsee=await CoreService.dio.post(
        CoreService.baseUrl+apiCreateProject,
        data: _data,
      options: Options(
        headers: {
          "Authorization": "Bearer ${userHive!.get("token")}"
        },
      ),
    );
    final value =  CoreService.responsee.data!;
    print( CoreService.responsee.statusCode);
    idProject=CoreService.responsee.data["id"];
    print(value);
    return true;
  }

  @override
  Future<DataState> GetProjectService(id_project) async{
    print(CoreService.baseUrl+apiGetProject+id_project.toString());
    CoreService.responsee=await CoreService.dio.get(
      CoreService.baseUrl+apiGetProject+id_project.toString(),
      options: Options(
        headers: {
          "Authorization": "Bearer ${userHive!.get("token")}"
        },
      ),
    );
    print( CoreService.responsee.statusCode);
    if(CoreService.responsee.statusCode==200){
      var getProgect=GetProjectMosel.fromJson(CoreService.responsee.data);
      print(getProgect);
      return SuccessState(getdata: getProgect);
    }else{
      return ErrorState(error: "error");
    }
  }

  @override
  Future<bool> deleteProjectService(id_project) async{
    print(CoreService.baseUrl+apiCreateProject+'/'+id_project.toString());
    CoreService.responsee=await CoreService.dio.delete(
      CoreService.baseUrl+apiCreateProject+'/'+id_project.toString(),
      options: Options(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
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
  Future<DataState> GetAllProjectService() async{
    print(CoreService.baseUrl+apiGetAllProjects);
    CoreService.responsee=await CoreService.dio.get(
      CoreService.baseUrl+apiGetAllProjects,
      options: Options(
        headers: {
          "Authorization": "Bearer ${userHive!.get("token")}"
        },
      ),
    );
    print( CoreService.responsee.statusCode);
    if(CoreService.responsee.statusCode==200){
      var getProgect=List.generate(CoreService.responsee.data.length, (index) =>GetProjectMosel.fromJson(CoreService.responsee.data[index]));
      print(getProgect);
      return SuccessStateList(getdataNew: getProgect);
    }else{
      return ErrorState(error: "error");
    }
  }
}
