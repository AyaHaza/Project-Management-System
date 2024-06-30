abstract class UserRepository{
  Future<bool>register( userModel);
  Future<bool>login( userModel);
  Future<bool>logout();
}