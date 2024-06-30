import 'dart:convert';
import '../../domain_layer/entities/project.dart';


ProjectModel projectModelFromJson(String str) => ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel extends ProjectEntity{
  ProjectModel({
    required super.projectName,
    required super.projectDescription,
    required super.projectStatus,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    projectName: json["projectName"],
    projectDescription: json["projectDescription"],
    projectStatus: json["projectStatus"],
  );

  Map<String, dynamic> toJson() => {
    "projectName": projectName,
    "projectDescription": projectDescription,
    "projectStatus": projectStatus,
  };
}
