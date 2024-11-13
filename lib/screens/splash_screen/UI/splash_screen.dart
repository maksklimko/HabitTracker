import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/screens/splash_screen/UI/path_animation.dart';

import '../../../utils/constants/colors.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.x1c1c1c,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 5,
                ),
                Text(
                  "track",
                  style: GoogleFonts.roboto(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: AppColors.x7d7e84,
                  ),
                ),
                Text(
                  "your habit.",
                  style: GoogleFonts.roboto(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: AppColors.xf6f6f7,
                    height: 1
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          const PathAnimation(),
        ],
      ),
    );
  }
}
