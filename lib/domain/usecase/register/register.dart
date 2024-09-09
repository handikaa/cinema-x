import '../../../data/repositories/authentication.dart';
import '../../../data/repositories/user_repository.dart';
import 'register_params.dart';
import '../usecase.dart';

import '../../result.dart';
import '../../user.dart';

class Register implements Usecase<Result<User>, RegisterParams> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  Register(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParams params) async {
    var getUid = await _authentication.register(
        email: params.email, password: params.password);
    if (getUid.isSuccess) {
      var createUser = await _userRepository.createUser(
          uid: getUid.resultValue!,
          email: params.email,
          name: params.name,
          photoUrl: params.photoUrl);

      if (createUser.isSuccess) {
        return Result.success(createUser.resultValue!);
      } else {
        return Result.failed(createUser.errorMessage!);
      }
    } else {
      return Result.failed(getUid.errorMessage!);
    }
  }
}
