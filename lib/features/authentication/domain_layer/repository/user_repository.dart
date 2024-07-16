abstract class UserRepository{
  Future<bool>register( userEntity);
  Future<bool>login( userEntity);
  Future<bool>logout();
}