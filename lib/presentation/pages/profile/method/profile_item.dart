import 'package:flix_id/presentation/misc/method.dart';
import 'package:flutter/material.dart';

Widget profileItem(String title, IconData? icon, {VoidCallback? onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: title != 'Update Profile' ? Colors.grey : null,
              radius: 20,
              child: Icon(icon)),
          horizontalSpace(20),
          Text(title),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
