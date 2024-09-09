import '../../../data/repositories/authentication.dart';
import '../usecase.dart';

import '../../result.dart';

class Logout implements Usecase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication})
      : _authentication = authentication;

  @override
  Future<Result<void>> call(void _) async {
    return _authentication.logOut();
  }
}
