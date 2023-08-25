import 'package:flutter/material.dart';
import 'package:smart_change/utilis/app_colors.dart';


class LoginFooter extends StatefulWidget {
  const LoginFooter({super.key});

  @override
  State<LoginFooter> createState() => _LoginFooterState();
}

class _LoginFooterState extends State<LoginFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 145,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(95),
              color: AppColors.ClickableBottonColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.ClickableBottonColor.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 5,
                )
              ]),
          child: Center(
            child: GestureDetector(
              onTap: () {
                
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Roboto'),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Sign in with',
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Colors.orangeAccent,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.FooterImageBorderColor,
                  ),
                  color: AppColors.FooterImageBgColor,
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage('Images/goog.png'))),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.FooterImageBorderColor,
                  ),
                  color: AppColors.FooterImageBgColor,
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage('Images/twit.png'))),
            ),
          ],
        )
      ],
    );
  }
  
}
