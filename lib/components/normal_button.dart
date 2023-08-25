// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class ColourlessButton extends StatefulWidget {
  final String text;
   final Function onPress;

  const ColourlessButton({super.key, required this.text, required this.onPress});

  @override
  State<ColourlessButton> createState() => _ColourlessButtonState();
  
  
}

class _ColourlessButtonState extends State<ColourlessButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
    
            borderRadius: BorderRadius.circular(95),
            //color: AppColors.ClickableBottonColor,
            border: Border.all()
            
            ),
        child: Center(
          child: GestureDetector(
            onTap: () async {
              await widget.onPress();
            },
            child: Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.black,
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