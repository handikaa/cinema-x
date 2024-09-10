import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/router/page_routes.dart';

Row registerText(TextTheme textTheme, WidgetRef ref, ThemeData theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have an account yet?",
        style: textTheme.bodyMedium,
      ),
      TextButton(
        onPressed: () {
          ref.read(routerProvider).goNamed('register');
        },
        child: Text(
          'Sign Up',
          style:
              textTheme.bodyMedium!.copyWith(color: theme.colorScheme.primary),
        ),
      )
    ],
  );
}
