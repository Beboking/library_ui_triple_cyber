import 'package:flutter/material.dart';

/// Triángulo invertido con vértices redondeados
class InvertedRoundedTriangle extends StatelessWidget {
  const InvertedRoundedTriangle({
    super.key,
    this.width = 40,
    this.height = 24,
    this.radius = 4,
    this.color = Colors.black,
  });

  /// Lado superior (base del triángulo)
  final double width;

  /// Altura hasta la punta
  final double height;

  /// Radio de redondeo en cada vértice
  final double radius;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _InvertedRoundedTrianglePainter(
        radius: radius,
        color: color,
      ),
    );
  }
}

class _InvertedRoundedTrianglePainter extends CustomPainter {
  const _InvertedRoundedTrianglePainter({
    required this.radius,
    required this.color,
  });

  final double radius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, 0); // esquina superior-izquierda
    final p2 = Offset(size.width, 0); // esquina superior-derecha
    final p3 = Offset(size.width / 2, size.height); // vértice inferior

    final r = radius.clamp(0, size.shortestSide / 3);

    final path = Path()
      // tramo p1 → p2 (línea superior)
      ..moveTo(p1.dx + r, p1.dy)
      ..lineTo(p2.dx - r, p2.dy)
      ..quadraticBezierTo(p2.dx, p2.dy, p2.dx, p2.dy + r)

      // tramo p2 → p3 (lado derecho)
      ..lineTo(p3.dx + r, p3.dy - r)
      ..quadraticBezierTo(p3.dx, p3.dy, p3.dx - r, p3.dy - r)

      // tramo p3 → p1 (lado izquierdo)
      ..lineTo(p1.dx, p1.dy + r)
      ..quadraticBezierTo(p1.dx, p1.dy, p1.dx + r, p1.dy)
      ..close();

    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
