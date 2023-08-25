// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:smart_change/utilis/app_colors.dart';

class PasswordTextField extends StatefulWidget {
  final String text;
  final void Function(String)? onChange;

  const PasswordTextField(
      {super.key, required this.text,this.onChange});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: TextFormField(
        onChanged: widget.onChange,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                    width: 2, color: AppColors.FooterImageBorderColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.FooterImageBorderColor,
                )),
            hintText: widget.text,
            filled: true,
            fillColor: AppColors.FooterImageBgColor,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: const Icon(
                  Icons.visibility_outlined,
                  color: AppColors.IconColor,
                ))),
      ),
    );
  }
}
