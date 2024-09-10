import 'package:flutter/material.dart';

enum ButtonType { extraLarge, large, medium, small, extraSmall }

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? buttonColor;
  final IconData? icon;
  final ButtonType buttonType;
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonColor,
    this.icon,
    required this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorTheme = theme.colorScheme;

    final double buttonHeight = switch (buttonType) {
      ButtonType.extraLarge => 56.0,
      ButtonType.large => 52,
      ButtonType.medium => 44.0,
      ButtonType.small => 36.0,
      ButtonType.extraSmall => 28.0,
    };

    return SizedBox(
      height: buttonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            buttonColor ?? colorTheme.surface,
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
