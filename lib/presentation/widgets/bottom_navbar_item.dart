import '../misc/method.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String title;
  final String image;
  final String selectedImage;

  const BottomNavbarItem(
      {super.key,
      required this.index,
      required this.isSelected,
      required this.title,
      required this.image,
      required this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            isSelected ? selectedImage : image,
          ),
          width: 25,
        ),
        verticalSpace(10),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
