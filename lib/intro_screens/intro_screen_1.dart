import 'package:flutter/material.dart';

class IntroScreenOne extends StatelessWidget {
  const IntroScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: const Center(
        child: Column(
          children: [
            SizedBox(
                height: 425,
                width: 400,
                child: Image(image: AssetImage('assets/images/touch.png'))),
            Text(
              '      Buy or sell SCSA and\nAlgo using Smart Change P2P',
              style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 11, 44, 12),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
