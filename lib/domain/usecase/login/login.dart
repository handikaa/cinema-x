import '../../../data/repositories/authentication.dart';
import '../../../data/repositories/user_repository.dart';

import '../../result.dart';
import '../../user.dart';
import '../usecase.dart';

part 'login_params.dart';

class Login implements Usecase<Result<User>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepositorie;

  Login({required this.authentication, required this.userRepositorie});
  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await authentication.login(
        email: params.email, password: params.pasword);

    if (idResult.isSuccess) {
      var userResult =
          await userRepositorie.getUSer(uid: idResult.resultValue!);

      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
