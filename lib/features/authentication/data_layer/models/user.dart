import 'dart:convert';
import '../../domain_layer/entities/user.dart';

List<UserModel> productModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String productModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class UserModel extends UserEntity{
  UserModel({
     super.firstName,  super.lastName, required super.email, required super.password,  super.role,
  });
   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
   );

   Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "role": role,
   };
}