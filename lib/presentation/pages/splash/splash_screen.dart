import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../misc/assets_location.dart';
import '../../misc/method.dart';
import '../../providers/router/page_routes.dart';
import '../../providers/user_data_provider/user_data_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    ref.listen(
      userDataProvider,
      (previous, next) async {
        await Future.delayed(const Duration(seconds: 2));
        if (next is AsyncData && next.value != null) {
          ref.read(routerProvider).goNamed('main');
        } else {
          ref.read(routerProvider).goNamed('welcome');
        }
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetsLocation.imageLocation('logo'),
              width: 88,
            ),
            verticalSpace(16),
            Text('CINEMAX', style: textTheme.displayLarge),
          ],
        ),
      ),
    );
  }
}
