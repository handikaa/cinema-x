import 'package:flutter/material.dart';

class BackNavigationBar extends StatelessWidget {
  const BackNavigationBar({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: onTap,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Text(
          title,
          style: textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: onTap,
          icon: const Icon(
            Icons.share,
          ),
        ),
      ],
    );
  }
}
