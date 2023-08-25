
import 'package:flutter/material.dart';
import 'package:smart_change/utilis/app_colors.dart';

class ExportedIcons extends StatefulWidget {
  final String iconUrl;
  final double iconsize;
  final Color iconcolor;
  const ExportedIcons({super.key, this.iconUrl="", this.iconsize=18,  this.iconcolor=AppColors.IconColor});

  @override
  State<ExportedIcons> createState() => _ExportedIconsState();
}

class _ExportedIconsState extends State<ExportedIcons> {
  @override
  Widget build(BuildContext context) {
    return ImageIcon(
       AssetImage(
              widget.iconUrl,
            ),
            size: widget.iconsize,
            color: widget.iconcolor,
    );
  }
}