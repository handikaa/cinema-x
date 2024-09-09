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
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: onTap,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
