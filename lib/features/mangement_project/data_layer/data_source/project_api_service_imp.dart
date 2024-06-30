import 'package:dio/dio.dart';
import 'package:project_management/features/mangement_project/data_layer/models/get_project.dart';
import '../../../../config/hive_config.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/resource/data_state.dart';
import '../../../../core/service/coreService.dart';
import 'project_api_service.dart';

class ProjectApiServiceImp implements ProjectApiService {
  @override
  Future<bool> createProjectService(projectModel) async{
    final _data = projectModel.toJson();
    print(CoreService.baseUrl+apiCreateProject);
    print(projectModel.toJson());
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
}
