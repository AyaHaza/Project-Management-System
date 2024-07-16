import '../../../domain_layer/entities/user.dart';
abstract class AuthEvents{}

class NewRegister extends AuthEvents{
  UserEntity userEntity;
  NewRegister({required this.userEntity});
}

class NewLogin extends AuthEvents{
  UserEntity userEntity;
  NewLogin({required this.userEntity});
}

class Logout extends AuthEvents{}