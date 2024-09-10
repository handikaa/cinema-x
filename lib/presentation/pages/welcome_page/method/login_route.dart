import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/router/page_routes.dart';

Row loginRoute(TextTheme textTheme, WidgetRef ref, ThemeData theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "I already have an account?",
        style: textTheme.bodyMedium,
      ),
      TextButton(
        onPressed: () {
          ref.read(routerProvider).goNamed('login');
        },
        child: Text(
          'Sign In',
          style:
              textTheme.bodyMedium!.copyWith(color: theme.colorScheme.primary),
        ),
      )
    ],
  );
}
