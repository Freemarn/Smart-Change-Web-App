import 'package:flutter/material.dart';
import 'package:smart_change/utilis/app_colors.dart';

// ignore: must_be_immutable
class SettingsContainers extends StatefulWidget {
  final String text;
  final String imageUrl;
  double size;

  SettingsContainers(
      {super.key, required this.text, this.size = 15, required this.imageUrl});

  @override
  State<SettingsContainers> createState() => _SettingsContainersState();
}

class _SettingsContainersState extends State<SettingsContainers> {
  @override
  Widget build(BuildContext context) {
    return
        // GestureDetector(
        //   onTap: ()  {
        //     setState(() {
        //       widget.onPress();
        //     });
        //   },
        //   child:
        Container(
      width: 320,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.FooterImageBorderColor)),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5)),
              child: Image.asset(widget.imageUrl)),
          const SizedBox(
            width: 15,
          ),
          Text(
            widget.text,
            style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 13,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
