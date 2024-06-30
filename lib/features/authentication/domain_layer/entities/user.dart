class UserEntity {
   String? firstName;
   String? lastName;
   String email;
   String password;
   String? role;

  UserEntity({
     this.firstName,
     this.lastName,
     required this.email,
     required this.password,
     this.role,
  });
}
