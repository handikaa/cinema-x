import 'dart:io';
import 'dart:math';

import 'package:flix_id/domain/result.dart';
import 'package:flix_id/presentation/extensions/build_extension_context.dart';
import 'package:flix_id/presentation/providers/router/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/user.dart';
import '../../misc/assets.dart';
import '../../misc/constants.dart';
import '../../misc/method.dart';
import '../../providers/user_data_provider/user_data_provider.dart';

class UpdateProfilePage extends ConsumerStatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  ConsumerState<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends ConsumerState<UpdateProfilePage> {
  List<String> photoList = [
    placeholder,
    pp1,
    pp2,
    pp3,
    pp4,
    pp5,
    pp6,
  ];

  final ImagePicker picker = ImagePicker();
  XFile? xfile;

  Future<XFile?> _cropImage(XFile image) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Flix Id',
          toolbarColor: backgroundColor,
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
    return Scaffold(
      body: ListView(
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
                    : ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                        ? NetworkImage(
                            ref.watch(userDataProvider).valueOrNull!.photoUrl!)
                        : AssetImage(
                            photoList[Random().nextInt(photoList.length)],
                          ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          verticalSpace(30),
          Column(
            children: [
              if (xfile != null)
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.red,
                    ),
                  ),
                  onPressed: () => setState(() {
                    xfile = null;
                  }),
                  child: const Text(
                    'delete image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    saffron,
                  ),
                ),
                onPressed: () => pickImage(),
                child: const Text(
                  'pick image',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    saffron,
                  ),
                ),
                onPressed: () async {
                  User? user = ref.watch(userDataProvider).valueOrNull;
                  var update = await ref
                      .read(userDataProvider.notifier)
                      .uploadProfilePicture(
                        user: user!,
                        image: File(xfile!.path),
                      );
                  ref.read(routerProvider).pop();
                },
                child: const Text(
                  'update profile image',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
