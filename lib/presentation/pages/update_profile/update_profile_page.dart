import 'dart:io';
import 'dart:math';
import 'package:flix_id/presentation/providers/router/page_routes.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/widgets/button/elevated_button_extra_lage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/user.dart';
import '../../misc/assets.dart';
import '../../misc/constants.dart';
import '../../misc/method.dart';
import '../../providers/user_data_provider/user_data_provider.dart';
import '../../widgets/textfield.dart';

class UpdateProfilePage extends ConsumerStatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  ConsumerState<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends ConsumerState<UpdateProfilePage> {
  final ImagePicker picker = ImagePicker();
  XFile? xfile;
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();

  List<String> photoList = [
    placeholder,
    pp1,
    pp2,
    pp3,
    pp4,
    pp5,
    pp6,
  ];

  Future<XFile?> _cropImage(XFile image) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Flix Id',
          toolbarColor: ThemeColor.darkBackground,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: true,
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: 'Flix Id',
          aspectRatioLockEnabled: true,
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );

    if (croppedFile != null) {
      return XFile(croppedFile.path);
    } else {
      return null;
    }
  }

  void pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final XFile? croppedFile = await _cropImage(image);
      setState(() {
        xfile = croppedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = ref.watch(userDataProvider).valueOrNull;
    String? name = user?.name ?? '';
    String email = user?.email ?? '';

    nameC.text = name;
    emailC.text = email;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              children: [
                BackNavigationBar(
                  title: 'Profile',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(40),
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: xfile != null
                              ? FileImage(
                                  File(xfile!.path),
                                )
                              : ref
                                          .watch(userDataProvider)
                                          .valueOrNull
                                          ?.photoUrl !=
                                      null
                                  ? NetworkImage(ref
                                      .watch(userDataProvider)
                                      .valueOrNull!
                                      .photoUrl!)
                                  : AssetImage(
                                      photoList[
                                          Random().nextInt(photoList.length)],
                                    ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.edit,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                verticalSpace(30),
                FlixTextField(
                  labelText: 'Email',
                  controller: emailC,
                ),
                verticalSpace(30),
                FlixTextField(
                  labelText: 'Name',
                  controller: nameC,
                ),
                verticalSpace(80),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: 'Update Profile',
                    buttonType: ButtonType.medium,
                    onPressed: () async {
                      await ref
                          .read(userDataProvider.notifier)
                          .uploadProfilePicture(
                            user: user!,
                            image: File(xfile!.path),
                          );
                      ref.read(routerProvider).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
