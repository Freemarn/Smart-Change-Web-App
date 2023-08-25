import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';

class MiniInputField extends StatefulWidget {
  const MiniInputField({super.key});

  @override
  State<MiniInputField> createState() => _MiniInputFieldState();
}

class _MiniInputFieldState extends State<MiniInputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: TextFormField(
        autofocus: true,
          decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade100)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                width: 2, color: AppColors.FooterImageBorderColor)),
        filled: true,
        fillColor: AppColors.fillColor,
      )),
    );
  }
}
