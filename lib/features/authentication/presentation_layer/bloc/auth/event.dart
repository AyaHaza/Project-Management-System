import '../../../data_layer/models/user.dart';
abstract class AuthEvents{}

class NewRegister extends AuthEvents{
  UserModel userModel;
  NewRegister({required this.userModel});
}

class NewLogin extends AuthEvents{
  UserModel userModel;
  NewLogin({required this.userModel});
}

class Logout extends AuthEvents{}