import '../../../data/repositories/user_repository.dart';
import 'upload_profile_picture_param.dart';
import '../usecase.dart';

import '../../result.dart';
import '../../user.dart';

class UploadProfilePicture
    implements Usecase<Result<User>, UploadProfilePictureParam> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<Result<User>> call(UploadProfilePictureParam params) => _userRepository
      .uploadProfilePict(user: params.user, imageFile: params.imageFile);
}
