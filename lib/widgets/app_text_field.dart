import 'package:flutter/material.dart';

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
    return TextField(
      minLines: isMultiline?3:null,
      maxLines: isMultiline?3:null,
      controller: controller,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
