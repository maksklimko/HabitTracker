import 'dart:math';

import 'package:beamer/beamer.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_tracker/utils/constants/colors.dart';

class PathAnimation extends StatefulWidget {
  const PathAnimation({super.key});

  @override
  State<PathAnimation> createState() => _PathAnimationState();
}

class _PathAnimationState extends State<PathAnimation>
    with TickerProviderStateMixin {
  late AnimationController pathAnimationController;

  @override
  void initState() {
    pathAnimationController = AnimationController(
      vsync: this,
      duration: 1.seconds,
    );

    pathAnimationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        AnimatedDrawing.paths(
          [getPath(screenSize)],
          scaleToViewport: false,
          paints: [
            Paint()
              ..color = Colors.white
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
          ],
          controller: pathAnimationController,
        ),
        Animate().custom(
          delay: 800.ms,
          duration: 400.ms,
          begin: 0,
          end: 4,
          curve: Curves.easeInQuint,
          builder: (_, value, __) => CustomPaint(
            painter: CirclePainter(
              center: Offset(screenSize.width / 5.5, screenSize.height / 3.4),
              radius: value,
            ),
            size: screenSize,
          ),
        ),
        Animate().custom(
          delay: 900.ms,
          duration: 400.ms,
          begin: 0,
          end: 7,
          curve: Curves.easeInQuint,
          builder: (_, value, __) => CustomPaint(
            painter: CirclePainter(
              center: Offset(screenSize.width / 4.9, screenSize.height / 2.45),
              radius: value,
            ),
            size: screenSize,
          ),
        ),
        Animate().custom(
          delay: 1000.ms,
          duration: 400.ms,
          begin: 0,
          end: 4,
          curve: Curves.easeInQuint,
          builder: (_, value, __) => CustomPaint(
            painter: CirclePainter(
              center: Offset(screenSize.width / 2, screenSize.height / 2.39),
              radius: value,
              isFilled: false,
            ),
            size: screenSize,
          ),
        ),
        Animate().custom(
          delay: 1100.ms,
          duration: 400.ms,
          begin: 0,
          end: 4,
          curve: Curves.easeInQuint,
          builder: (_, value, __) => CustomPaint(
            painter: CirclePainter(
              center: Offset(screenSize.width / 1.25, screenSize.height / 1.9),
              radius: value,
              isFilled: false,
            ),
            size: screenSize,
          ),
        ),
        Animate(
          onComplete: (_) => Beamer.of(context).beamToNamed("/main"),
        ).custom(
          delay: 1600.ms,
          duration: 500.ms,
          curve: Curves.easeInQuint,
          builder: (_, value, __) => CustomPaint(
            painter: CirclePainter(
              center: Offset(screenSize.width / 4.9, screenSize.height / 2.45),
              radius: value * max(screenSize.height, screenSize.width),
              isFilled: false,
            ),
            size: screenSize,
          ),
        ),
      ],
    );
  }

  Path getPath(Size size) {
    return Path()
      ..moveTo(0, size.height / 4)
      ..quadraticBezierTo(size.width / 5.5, size.height / 3.3, size.width / 3,
          size.height / 3.25)
      ..cubicTo(size.width / 2.4, size.height / 3.2, size.width / 2.2,
          size.height / 2.9, size.width / 4, size.height / 2.6)
      ..cubicTo(size.width / 5, size.height / 2.53, size.width / 7,
          size.height / 2.35, size.width / 3, size.height / 2.35)
      ..cubicTo(size.width / 3, size.height / 2.345, size.width / 2,
          size.height / 2.4, size.width / 1.7, size.height / 2.4)
      ..cubicTo(size.width / 1.7, size.height / 2.40, size.width / 1.35,
          size.height / 2.4, size.width / 1.3, size.height / 2.2)
      ..cubicTo(size.width / 1.3, size.height / 2.07, size.width / 1.4,
          size.height / 2.05, size.width / 1.4, size.height / 2)
      ..cubicTo(size.width / 1.4, size.height / 1.95, size.width / 1.4,
          size.height / 1.9, size.width, size.height / 1.85);
  }
}

class CirclePainter extends CustomPainter {
  final Offset center;
  final Color color;
  final double radius;
  final bool isFilled;

  CirclePainter({
    required this.center,
    this.color = Colors.white,
    this.radius = 5,
    this.isFilled = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 1;
    Paint backgroundPaint = Paint()
      ..color = AppColors.x1c1c1c
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = Path()
      ..moveTo(0, size.height / 4)
      ..quadraticBezierTo(size.width / 5.5, size.height / 3.3, size.width / 3,
          size.height / 3.25)
      ..cubicTo(size.width / 2.4, size.height / 3.2, size.width / 2.2,
          size.height / 2.9, size.width / 4, size.height / 2.6)
      ..cubicTo(size.width / 5, size.height / 2.53, size.width / 7,
          size.height / 2.35, size.width / 3, size.height / 2.35)
      ..cubicTo(size.width / 3, size.height / 2.345, size.width / 2,
          size.height / 2.4, size.width / 1.7, size.height / 2.4)
      ..cubicTo(size.width / 1.7, size.height / 2.40, size.width / 1.35,
          size.height / 2.4, size.width / 1.3, size.height / 2.2)
      ..cubicTo(size.width / 1.3, size.height / 2.07, size.width / 1.4,
          size.height / 2.05, size.width / 1.4, size.height / 2)
      ..cubicTo(size.width / 1.4, size.height / 1.95, size.width / 1.4,
          size.height / 1.9, size.width, size.height / 1.85);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
