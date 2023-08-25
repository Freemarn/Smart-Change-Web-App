import 'package:flutter/material.dart';

class IntroScreenFive extends StatelessWidget {
  const IntroScreenFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: 450,
                width: 300,
                child: Image.asset('assets/images/connect2.png')),
            const Text(
              '      All Smart Change merchnats are\n                 verified and trusted',
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
