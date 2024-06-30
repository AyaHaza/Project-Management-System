import '../../../../core/usecases/usecases.dart';
import '../../data_layer/models/user.dart';
import '../repository/user_repository.dart';

class RegisterUseCase implements UseCse<bool,UserModel>{
  final UserRepository _userRepository;
  RegisterUseCase(this._userRepository);

  @override
  Future<bool> call(params) {
    return _userRepository.register(params);
  }
}