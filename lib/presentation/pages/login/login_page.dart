import 'package:flix_id/presentation/widgets/button/elevated_button_extra_lage.dart';

import 'method/register_route.dart';

import '../../extensions/build_extension_context.dart';
import '../../misc/assets_location.dart';
import '../../misc/method.dart';
import '../../providers/router/page_routes.dart';
import '../../providers/user_data_provider/user_data_provider.dart';
import '../../widgets/textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  bool _isSelected = false;
  final box = GetStorage();

  void saveRemember() async {
    if (_isSelected == true) {
      await box.remove('remember');
      await box.write('remember', {
        'email': emailC.text,
        'pass': passC.text,
        'remember': _isSelected,
      });
    } else {
      await box.remove('remember');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed('main');

            context.showSnackbar(
                'Berhasil Login, Selamat Datang', SnackBarType.succes);
          }
        } else if (next is AsyncError) {
          final error = next.error.toString();

          context.showSnackbar(error, SnackBarType.error);
        }
      },
    );
    if (box.read('remember') != null) {
      setState(() {
        emailC.text = box.read('remember')['email'];
        passC.text = box.read('remember')['pass'];
      });
    }
    return Scaffold(
      body: ListView(
        children: [
          verticalSpace(100),
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
          verticalSpace(100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                FlixTextField(
                  labelText: 'Email',
                  controller: emailC,
                ),
                verticalSpace(20),
                FlixTextField(
                  labelText: 'Password',
                  controller: passC,
                  obSecureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: const EdgeInsets.all(0),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _isSelected,
                        onChanged: (_) {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                        title: const Text('Remember Me'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                verticalSpace(24),
                switch (ref.watch(userDataProvider)) {
                  AsyncData(:final value) => value == null
                      ? SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButton(
                            buttonType: ButtonType.extraLarge,
                            text: 'Sign In',
                            onPressed: ref.watch(userDataProvider).maybeWhen(
                                  data: (_) => () {
                                    FocusScope.of(context).unfocus();

                                    if (emailC.text.isNotEmpty &&
                                        passC.text.isNotEmpty) {
                                      saveRemember();
                                      ref.read(userDataProvider.notifier).login(
                                          email: emailC.text,
                                          password: passC.text);
                                    } else {
                                      context.showSnackbar(
                                          'Email and Password cannot be empty!',
                                          SnackBarType.error);
                                    }
                                  },
                                  orElse: () =>
                                      null, // Disable button during loading or error
                                ),
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
                registerText(textTheme, ref, theme)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
