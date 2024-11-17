import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/constants/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, this.width, this.onTap});

  final String title;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppColors.x08080a,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.xf6f6f7),
          ),
        ),
      ),
    );
  }
}
