import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/constants/colors.dart';

class PathAnimation extends StatefulWidget {
  const PathAnimation({super.key});

  @override
  State<PathAnimation> createState() => _PathAnimationState();
}

class _PathAnimationState extends State<PathAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> circle1Animation;
  late Animation<double> circle2Animation;
  late Animation<double> circle3Animation;
  late Animation<double> circle4Animation;
  late Animation<double> largeCircleAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    circle1Animation = Tween<double>(begin: 0, end: 4).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.4,
          0.6,
          curve: Curves.elasticOut,
        ),
      ),
    );

    circle2Animation = Tween<double>(begin: 0, end: 7).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.45,
          0.65,
          curve: Curves.elasticOut,
        ),
      ),
    );

    circle3Animation = Tween<double>(begin: 0, end: 4).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.5,
          0.7,
          curve: Curves.elasticOut,
        ),
      ),
    );

    circle4Animation = Tween<double>(begin: 0, end: 4).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.55,
          0.75,
          curve: Curves.elasticOut,
        ),
      ),
    );

    largeCircleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.65,
          0.9,
          curve: Curves.easeInQuint,
        ),
      ),
    );

    animationController.addListener(() => setState(() {}));
    animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomPaint(
          painter: PathPainter(),
          size: screenSize,
        ),
        CustomPaint(
          painter: CirclePainter(
            center: Offset(screenSize.width / 5.5, screenSize.height / 3.4),
            radius: circle1Animation.value,
          ),
          size: screenSize,
        ),
        CustomPaint(
          painter: CirclePainter(
            center: Offset(screenSize.width / 4.9, screenSize.height / 2.45),
            radius: circle2Animation.value,
          ),
          size: screenSize,
        ),
        CustomPaint(
          painter: CirclePainter(
            center: Offset(screenSize.width / 2, screenSize.height / 2.39),
            radius: circle3Animation.value,
            isFilled: false,
          ),
          size: screenSize,
        ),
        CustomPaint(
          painter: CirclePainter(
            center: Offset(screenSize.width / 1.25, screenSize.height / 1.9),
            radius: circle4Animation.value,
            isFilled: false,
          ),
          size: screenSize,
        ),
        CustomPaint(
          painter: CirclePainter(
            center: Offset(screenSize.width / 4.9, screenSize.height / 2.45),
            radius: largeCircleAnimation.value*screenSize.height,
            isFilled: false,
          ),
          size: screenSize,
        ),
      ],
    );
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
      ..style =  PaintingStyle.fill
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
    Path path = Path();
    path.moveTo(0, size.height / 4);
    path.quadraticBezierTo(size.width / 5.5, size.height / 3.3, size.width / 3,
        size.height / 3.25);
    path.cubicTo(size.width / 2.4, size.height / 3.2, size.width / 2.2,
        size.height / 2.9, size.width / 4, size.height / 2.6);
    path.cubicTo(size.width / 5, size.height / 2.53, size.width / 7,
        size.height / 2.35, size.width / 3, size.height / 2.35);
    path.cubicTo(size.width / 3, size.height / 2.345, size.width / 2,
        size.height / 2.4, size.width / 1.7, size.height / 2.4);
    path.cubicTo(size.width / 1.7, size.height / 2.40, size.width / 1.35,
        size.height / 2.4, size.width / 1.3, size.height / 2.2);
    path.cubicTo(size.width / 1.3, size.height / 2.07, size.width / 1.4,
        size.height / 2.05, size.width / 1.4, size.height / 2);
    path.cubicTo(size.width / 1.4, size.height / 1.95, size.width / 1.4,
        size.height / 1.9, size.width, size.height / 1.85);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
