import '../../../data/repositories/authentication.dart';
import '../../../data/repositories/user_repository.dart';
import '../usecase.dart';

import '../../result.dart';
import '../../user.dart';

class GetLoggedUser implements Usecase<Result<User>, void> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  GetLoggedUser(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(void _) async {
    String? uid = _authentication.getLoginUserId();

    if (uid != null) {
      Result<User> userResult = await _userRepository.getUSer(uid: uid);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return const Result.failed('akun tidak ditemukan silahkan login');
    }
  }
}
