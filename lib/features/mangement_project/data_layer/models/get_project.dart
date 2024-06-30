import 'dart:convert';
import '../../domain_layer/entities/get_poject.dart';

GetProjectMosel getProjectMoselFromJson(String str) => GetProjectMosel.fromJson(json.decode(str));

String getProjectMoselToJson(GetProjectMosel data) => json.encode(data.toJson());

class GetProjectMosel extends GetProjectEntity{

  GetProjectMosel({
    required super.id,
    required super.name,
    required super.description,
    required super.status,
    required super.createDate,
    required super.lastModified,
    required super.createdBy,
    required super.lastModifiedBy,
  });

  factory GetProjectMosel.fromJson(Map<String, dynamic> json) => GetProjectMosel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    status: json["status"],
    createDate: DateTime.parse(json["createDate"]),
    lastModified: json["lastModified"],
    createdBy: json["createdBy"],
    lastModifiedBy: json["lastModifiedBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "status": status,
    "createDate": createDate.toIso8601String(),
    "lastModified": lastModified,
    "createdBy": createdBy,
    "lastModifiedBy": lastModifiedBy,
  };
}
