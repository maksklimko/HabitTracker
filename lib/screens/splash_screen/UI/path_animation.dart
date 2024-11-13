import 'dart:math';

import 'package:flutter/material.dart';

class PathAnimation extends StatelessWidget {
  const PathAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
      size: MediaQuery.of(context).size,
    );
  }
}

class PathPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =  Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = Path();
    path.moveTo(0, size.height/4);
    path.quadraticBezierTo(size.width / 5.5, size.height/3.3, size.width / 3, size.height/3.25);
    path.cubicTo(size.width / 2.4, size.height/3.2, size.width / 2.2, size.height/2.9,size.width / 4, size.height/2.6);
    path.cubicTo(size.width / 5, size.height/2.53,size.width / 7, size.height/2.35,size.width / 3, size.height/2.35);
    path.cubicTo(size.width / 3, size.height/2.345,size.width / 2, size.height/2.4,size.width / 1.7, size.height/2.4);
    path.cubicTo(size.width / 1.7, size.height/2.40,size.width / 1.35, size.height/2.4,size.width / 1.3, size.height/2.2);
    path.cubicTo(size.width / 1.3, size.height/2.07,size.width / 1.4, size.height/2.05,size.width / 1.4, size.height/2);
    path.cubicTo(size.width / 1.4, size.height/1.95,size.width / 1.4, size.height/1.9,size.width, size.height/1.85);
    canvas.drawPath(path, paint);
  }
  double degToRad(num deg) => deg * (pi / 180.0);
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
