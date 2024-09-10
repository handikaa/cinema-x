import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/user.dart';
import '../../extensions/build_extension_context.dart';
import '../../misc/assets_location.dart';
import '../../misc/constants.dart';
import '../../misc/method.dart';
import '../../providers/router/page_routes.dart';
import '../../providers/user_data_provider/user_data_provider.dart';
import '../../widgets/button/elevated_button_extra_lage.dart';
import '../../widgets/textfield.dart';
import '../welcome_page/method/login_route.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmPassC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? xfile;

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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    ref.listen(
      userDataProvider,
      (previous, next) async {
        if (next is AsyncData && next.value != null) {
          // await ref.read(userDataProvider.notifier).logout();

          ref.read(routerProvider).goNamed('login');
          context.showSnackbar(
              'Berhasil Register, Silahkan Login', SnackBarType.succes);
        } else if (next is AsyncError) {
          context.showSnackbar(next.error.toString(), SnackBarType.error);
        }
      },
    );

    return Scaffold(
      body: ListView(
        children: [
          verticalSpace(50),
          Center(
            child: Column(
              children: [
                Image(
                  image: AssetsLocation.imageLocation('logo'),
                  width: 88,
                ),
                Text(
                  'CINEMAX',
                  style: textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          verticalSpace(50),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      xfile != null ? FileImage(File(xfile!.path)) : null,
                  child: xfile == null
                      ? IconButton(
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: pickImage,
                        )
                      : null,
                ),
                if (xfile != null)
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          xfile = null;
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                verticalSpace(50),
                FlixTextField(
                  labelText: 'Email',
                  controller: emailC,
                ),
                verticalSpace(20),
                FlixTextField(
                  labelText: 'Name',
                  controller: nameC,
                ),
                verticalSpace(20),
                FlixTextField(
                  labelText: 'Password',
                  controller: passC,
                  obSecureText: true,
                ),
                verticalSpace(20),
                FlixTextField(
                  labelText: 'Confirm Password',
                  controller: confirmPassC,
                  obSecureText: true,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                verticalSpace(24),
                switch (ref.watch(userDataProvider)) {
                  AsyncData(:final value) => value == null
                      ? SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButton(
                            text: 'Sign Up',
                            onPressed: () async {
                              if (nameC.text.isNotEmpty &&
                                  passC.text.isNotEmpty &&
                                  nameC.text.isNotEmpty) {
                                if (passC.text == confirmPassC.text) {
                                  await ref
                                      .read(userDataProvider.notifier)
                                      .register(
                                        email: emailC.text,
                                        password: passC.text,
                                        name: nameC.text,
                                      );
                                  if (xfile != null) {
                                    User? user =
                                        ref.read(userDataProvider).valueOrNull;

                                    await ref
                                        .read(userDataProvider.notifier)
                                        .uploadProfilePicture(
                                          user: user!,
                                          image: File(xfile!.path),
                                        );
                                  }
                                } else {
                                  context.showSnackbar(
                                      'Password doesn\'t match',
                                      SnackBarType.error);
                                }
                              } else {
                                context.showSnackbar(
                                    'Form fields cannot be empty!',
                                    SnackBarType.error);
                              }
                            },
                            buttonType: ButtonType.extraLarge,
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    ),
                },
                verticalSpace(24),
                loginRoute(textTheme, ref, theme),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (1, 1);

  @override
  String get name => '1x1 (customized)';
}
