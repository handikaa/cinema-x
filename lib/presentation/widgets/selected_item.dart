import 'package:flutter/material.dart';

import '../misc/constants.dart';

class SeletedItem extends StatelessWidget {
  final String text;
  final bool isAvailable;
  final bool isSelect;
  final VoidCallback? onTap;
  const SeletedItem({
    super.key,
    required this.text,
    this.isAvailable = false,
    this.isSelect = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100),
      child: GestureDetector(
        onTap: isAvailable ? onTap : null,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isAvailable
                ? isSelect
                    ? theme.colorScheme.primary.withOpacity(0.8)
                    : theme.colorScheme.primary.withOpacity(0.2)
                : Colors.grey,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black45, width: 2),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: textTheme.bodySmall!.backgroundColor,
                fontSize: 14,
                fontWeight: bold),
          ),
        ),
      ),
    );
  }
}
