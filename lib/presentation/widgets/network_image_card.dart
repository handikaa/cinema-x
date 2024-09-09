import '../misc/method.dart';
import 'package:flutter/material.dart';

class NetworkImageCard extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final String title;
  final BoxFit? fit;
  final double borderRadius;
  final VoidCallback? onTap;

  const NetworkImageCard({
    super.key,
    this.width = 150,
    this.height = 230,
    this.imageUrl,
    this.fit,
    this.borderRadius = 10,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(borderRadius)),
            child: Stack(
              children: [
                if (imageUrl != null)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (imageUrl != null)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl!), fit: BoxFit.cover),
                    ),
                  ),
              ],
            ),
          ),
          verticalSpace(10),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
