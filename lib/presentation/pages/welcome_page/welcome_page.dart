import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../misc/assets_location.dart';
import '../../misc/method.dart';
import '../../providers/router/page_routes.dart';
import '../../widgets/button/elevated_button_extra_lage.dart';
import 'method/app_intro.dart';
import 'method/login_route.dart';
import 'method/signup_text.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      body: ListView(
        children: [
          const Padding(padding: EdgeInsets.only(top: 120)),
          appIntro(
            titleStyle: textTheme.headlineLarge,
            subtitleStyle: textTheme.headlineMedium,
          ),
          verticalSpace(82),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomElevatedButton(
              text: 'Sign Up',
              onPressed: () {
                ref.read(routerProvider).goNamed('register');
              },
              buttonType: ButtonType.extraLarge,
            ),
          ),
          // ThemeSwitcher(),
          verticalSpace(32),
          loginRoute(textTheme, ref, theme),
          verticalSpace(32),
          signUpText(textTheme),
          verticalSpace(32),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetsLocation.iconLocation('google'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
