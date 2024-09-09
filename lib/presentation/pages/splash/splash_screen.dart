import '../../providers/router/page_routes.dart';
import '../../providers/user_data_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../misc/assets.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataProvider,
      (previous, next) async {
        await Future.delayed(const Duration(seconds: 3));
        if (next is AsyncData && next.value != null) {
          ref.read(routerProvider).goNamed('main');
        } else {
          ref.read(routerProvider).goNamed('login');
        }
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flix Id',
              style: GoogleFonts.aBeeZee(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.asset(popcorn, width: 200),
          ],
        ),
      ),
    );
  }
}
