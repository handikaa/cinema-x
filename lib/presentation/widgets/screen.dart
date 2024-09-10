import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flutter/material.dart';

class CurvedScreen extends StatelessWidget {
  const CurvedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Stack(
        children: [
          ClipPath(
            clipper: CurvedClipper(),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.4),
                    theme.colorScheme.primary.withOpacity(0.3),
                    theme.colorScheme.primary.withOpacity(0.2),
                    theme.colorScheme.primary.withOpacity(0.1),
                    // Colors.amberAccent.withOpacity(0.4),
                    // Colors.amberAccent.withOpacity(0.3),
                    // Colors.amberAccent.withOpacity(0.1),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 21), // Ukuran layar
              painter: ScreenPainter(strokeWidth: 6),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 70); // Garis lurus sampai bawah
    path.quadraticBezierTo(
      size.width / 2, // Titik tengah lengkung
      size.height + 15, // Tinggi lengkung ke atas
      size.width, // Ujung kanan
      size.height - 50, // Posisi akhir di kanan
    );
    path.lineTo(size.width, 0); // Kembali ke titik awal di kanan atas
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ScreenPainter extends CustomPainter {
  final double strokeWidth;

  ScreenPainter({
    super.repaint,
    required this.strokeWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ThemeColor.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth; // Ubah ini untuk membuat garis lebih tebal

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2, // Titik tengah untuk lengkungan
      size.height + 100, // Tinggi lengkungan ke atas
      size.width, // Ujung kanan
      size.height, // Posisi akhir di kanan
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
