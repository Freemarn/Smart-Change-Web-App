// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:smart_change/Pages/welcome_home.dart';
import 'package:smart_change/components/nav_bar.dart';
import 'package:smart_change/screens/Tab%20bar%20screen/forgot_password.dart';
import 'package:smart_change/utilis/app_colors.dart';
import '../../components/input_field.dart';
import '../../components/login_footer.dart';
import '../../components/normal_button.dart';
import '../../components/orange_button.dart';
import '../../components/password_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utilis/exported_icons.dart';
import 'additional_secure.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  int counter = 0;

  String email = '';
  String password = '';

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blueGrey.shade800,
              strokeWidth: 4,
            ),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context);

      
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //wrong email
      showErrorMessage(e.code);
    }
    
  }

//wrong email message popup
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
                  height: 80,
                  width: 150,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.report_gmailerrorred_rounded,
                        size: 40,
                        //color: Colors.blueGrey,
                        color: AppColors.ClickableBottonColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        message,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Column(
        children: <Widget>[
          InputField(
             onChange: (value) {
                email = value;
              },
              //contrtoller: emailController,
              text: 'Email',
              textSize: 14,
              imageUrl: 'assets/images/at.png',
              Iconcolor: AppColors.IconColor),
          const SizedBox(
            height: 15,
          ),
          PasswordTextField(
            onChange: (value) {
                password = value;
              },
            text: 'Password',
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ForgotPassword()));
              setState(() {});
            },
            child: const Text(
              'Forget Password?',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
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
                onTap: signUserIn,
                child: const Text(
                  'SignIn',
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
      ),
    );
  }

  
}
