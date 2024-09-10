import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme/theme_provider.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Switch(
      value: isDarkMode,
      onChanged: (value) {
        ref.read(themeProvider.notifier).toggleTheme();
      },
      activeColor: Colors.blueAccent,
    );
  }
}
