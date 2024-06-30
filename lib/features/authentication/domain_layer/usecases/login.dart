import '../../../../core/usecases/usecases.dart';
import '../../data_layer/models/user.dart';
import '../repository/user_repository.dart';

class LoginUseCase implements UseCse<bool,UserModel>{
  final UserRepository _userRepository;
  LoginUseCase(this._userRepository);

  @override
  Future<bool> call(params) {
    return _userRepository.login(params);
  }
}