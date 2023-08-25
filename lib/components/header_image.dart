import 'package:flutter/material.dart';

class CryptoSmartLogo extends StatelessWidget {
  final double height;
  final double width;

  const CryptoSmartLogo({this.height = 100, this.width = 120, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('Images/crypto.png'))),
    );
  }
}
