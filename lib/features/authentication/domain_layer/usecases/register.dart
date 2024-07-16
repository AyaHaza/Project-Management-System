import '../../../../core/usecases/usecases.dart';
import '../entities/user.dart';
import '../repository/user_repository.dart';

class RegisterUseCase implements UseCse<bool,UserEntity>{
  final UserRepository _userRepository;
  RegisterUseCase(this._userRepository);

  @override
  Future<bool> call(params) {
    return _userRepository.register(params);
  }
}