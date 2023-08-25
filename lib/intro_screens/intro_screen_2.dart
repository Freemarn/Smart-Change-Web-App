import 'package:flutter/material.dart';

class IntroScreenTwo extends StatelessWidget {
  const IntroScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 425,
                width: 400,child: Image(image: AssetImage('assets/images/mob2.png'))),
            
            Text(
              '  Buy with ₦aira or stable\ncoin on other Blockchains',
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
