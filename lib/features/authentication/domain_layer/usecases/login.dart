import '../../../../core/usecases/usecases.dart';
import '../entities/user.dart';
import '../repository/user_repository.dart';

class LoginUseCase implements UseCse<bool,UserEntity>{
  final UserRepository _userRepository;
  LoginUseCase(this._userRepository);

  @override
  Future<bool> call(params) {
    return _userRepository.login(params);
  }
}