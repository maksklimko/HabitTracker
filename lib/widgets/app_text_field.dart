import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/constants/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.isMultiline = false,
    this.hint,
    this.controller,
    this.onChanged,
  });

  final bool isMultiline;
  final String? hint;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        minLines: isMultiline?3:null,
        maxLines: isMultiline?3:null,
        controller: controller,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.xbec0c7, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.xbec0c7, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.xbec0c7, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: AppColors.xbec0c7),
        ),
      ),
    );
  }
}
