import 'package:flutter/material.dart';

class IntroScreenFour extends StatelessWidget {
  const IntroScreenFour({super.key});

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
                child: Image(image: AssetImage('assets/images/chat2.png'))),
            Text(
              '    All you need to do is chat with any\nSmart Change merchant to begin your\n                           trade',
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
