import 'package:flutter/material.dart';

class IntroScreenThree extends StatelessWidget {
  const IntroScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      body:  const Center(
        child: Column(
          children: [
            SizedBox(height: 425,
                width: 400,child: Image(image: AssetImage('assets/images/trans2.png'))),
            
            Text(
              '    Sell \$CSA/\$Algos and receive ₦\nor stable coins on other Blockchains',
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