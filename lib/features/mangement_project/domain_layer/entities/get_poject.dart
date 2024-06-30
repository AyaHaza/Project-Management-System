
class GetProjectEntity{
  int id;
  String name;
  String description;
  String status;
  DateTime createDate;
  dynamic lastModified;
  int createdBy;
  dynamic lastModifiedBy;

  GetProjectEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.createDate,
    required this.lastModified,
    required this.createdBy,
    required this.lastModifiedBy,
  });
}
