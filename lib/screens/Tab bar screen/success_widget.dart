import 'package:flutter/material.dart';
import 'package:smart_change/screens/auth.dart';
import '../../components/orange_button.dart';


class SuccessMessage extends StatefulWidget {
  const SuccessMessage({super.key});

  @override
  State<SuccessMessage> createState() => _SuccessMessageState();
}

class _SuccessMessageState extends State<SuccessMessage> {
  @override
  Widget build(BuildContext context) {
    return Material(
color: Colors.white,
      child: SizedBox(
         height: 90,
        width: 150,
        child: Column(
          children: [
            const Image(image: AssetImage('assets/Images/lucky.gif')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Password reset successful!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {},
                child: OrangeButton(
                  text: 'Return to sign in',
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AuthPage()));
                  },
                ))
          ],
        ),
      ),
    );
  }
}
