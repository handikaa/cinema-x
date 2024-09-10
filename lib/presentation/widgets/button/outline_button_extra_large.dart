import 'package:flutter/material.dart';

class OutlineButtonExtraLarge extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? buttonColor;
  final IconData? icon;
  const OutlineButtonExtraLarge({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorTheme = theme.colorScheme;
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll<Color>(
            buttonColor ?? colorTheme.surface, // Mengatur warna teks dan ikon
          ),
          side: WidgetStatePropertyAll<BorderSide>(
            BorderSide(
              color: buttonColor ??
                  colorTheme.primary, // Mengatur warna border/outline
              width: 2, // Ubah ketebalan border jika diperlukan
            ),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                ),
              Text(
                text,
                style: textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
