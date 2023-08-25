// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:smart_change/utilis/app_colors.dart';
import 'package:smart_change/utilis/exported_icons.dart';

class InputField extends StatefulWidget {
  
  final String text;
  final double textSize;
  final String imageUrl;
  final double iconSize;
  final Color Iconcolor;
  final void Function(String)?onChange;

  const InputField({
    required this.text,
    required this.textSize,
    required this.imageUrl,
    this.iconSize = 18,
    required this.Iconcolor,
    super.key, this.onChange,
  });



  @override
  State<InputField> createState() => _InputFieldState();
}

  


class _InputFieldState extends State<InputField> {

  

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
                    width: 2, color: AppColors.FooterImageBorderColor)),
            filled: true,
            fillColor: AppColors.fillColor,
            hintText: widget.text,
            hintStyle: TextStyle(
              fontSize: widget.textSize,
            ),
            suffixIcon: ExportedIcons(
              iconUrl: widget.imageUrl,
              iconcolor: AppColors.IconColor,
            )),
      ),
    );
  }
}
