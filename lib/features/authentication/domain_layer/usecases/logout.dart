import '../../../../core/usecases/usecases.dart';
import '../repository/user_repository.dart';

class LogoutUseCase implements UseCse<bool,String>{
  final UserRepository _userRepository;
  LogoutUseCase(this._userRepository);

  @override
  Future<bool> call(params) {
    return _userRepository.logout();
  }
}