import 'dart:io';

import '../../user.dart';

class UploadProfilePictureParam {
  final User user;
  final File imageFile;

  UploadProfilePictureParam({required this.user, required this.imageFile});
}
