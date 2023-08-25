

import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';

class OrangeButton extends StatefulWidget {
  final String text;
  final Function onPress;
  const OrangeButton({super.key, required this.text, required this.onPress});

  @override
  State<OrangeButton> createState() => _OrangeButtonState();
}

class _OrangeButtonState extends State<OrangeButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(95),
            color: AppColors.ClickableBottonColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.ClickableBottonColor.withOpacity(0.2),
                spreadRadius: 10,
                blurRadius: 5,
              )
            ]),
        child: Center(
          child: GestureDetector(
            onTap: () async {
              await widget.onPress();
            },
            child: Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontFamily: 'Roboto'),
            ),
          ),
        ),
      ),
    );
  }
}
