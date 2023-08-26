// ignore_for_file: unused_import

import 'dart:js';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_change/components/nav_bar.dart';
import 'package:smart_change/providers/signup.dart';
import 'package:smart_change/utilis/app_colors.dart';
import '../../components/input_field.dart';
import '../../components/normal_button.dart';
import '../../components/orange_button.dart';
import '../../components/password_form.dart';
import 'additional_secure.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String email = '';
  String password1 = '';
  String password2 = '';
  bool isMerchant = false;
  String username = '';
  String phone = '';

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void signUserUp() async {
     if(passwordConfirmed()){
       try {
        final response =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password1,
        );
         
        

        await addUserDetails(
          username,
          email,
          phone,
        );
  

        print(response.user);
      } catch (e) {
        print(e);
      }
     }
    
  }

  Future<void> addUserDetails(
      String username, String email, String phone) async {
    await FirebaseFirestore.instance.collection('users').add({
      'username': username,
      'email': email,
      'phone': phone,
    });
  }

  bool passwordConfirmed() {
    if (password1 == password2) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 600,
        child: Column(
          children: <Widget>[
            InputField(
              onChange: (value) {
                username = value;
              },
              text: 'User Name',
              textSize: 15,
              Iconcolor: AppColors.IconColor,
              imageUrl: 'assets/images/user.png',
            ),
            const SizedBox(
              height: 8,
            ),
            InputField(
              onChange: (value) {
                email = value;
              },
              text: 'Email address',
              textSize: 15,
              Iconcolor: AppColors.IconColor,
              imageUrl: 'assets/images/at.png',
            ),
            const SizedBox(
              height: 8,
            ),
            InputField(
              onChange: (value) {
                phone = value;
              },
              text: 'Phone | +234',
              textSize: 15,
              Iconcolor: AppColors.IconColor,
              imageUrl: 'assets/images/telephone.png',
            ),
            const SizedBox(
              height: 8,
            ),
            PasswordTextField(
              onChange: (value) {
                password1 = value;
              },
              text: 'Password',
            ),
            const SizedBox(
              height: 8,
            ),
            PasswordTextField(
              onChange: (value) {
                password2 = value;
              },
              text: 'Confirm Password',
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
                  
                  onTap: () async {
                    // await signUserUp();
                    // print("Sign up");
                    await context.read<SignupProvider>().signup(
                          context,
                          username,
                          password1,
                          phone,
                          email,
                        );
                         
                  },
                   
                  child: const Text(
                    'SignUp',
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
              height: 13,
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
              height: 8,
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
                  width: 8,
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
                      image: AssetImage('Images/twit.png'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void openDialog(context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Include Additional Security',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                  color: Color.fromARGB(255, 11, 44, 12)),
            ),
          ),
          content: const SizedBox(
            height: 180,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.security_outlined,
                        size: 60,
                        color: AppColors.ClickableBottonColor,
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Text(
                          '   Include additional security features\nto protect your account from external\n   threats and unauthorized activities',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: Color.fromARGB(255, 11, 44, 12)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: ColourlessButton(
                      text: 'Skip',
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                    )),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {},
                    child: OrangeButton(
                      text: 'Continue',
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdditionalSecure()));
                      },
                    )),
              ],
            )
          ],
        ),
      );
}
