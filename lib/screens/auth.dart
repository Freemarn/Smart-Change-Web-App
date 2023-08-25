import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_change/components/nav_bar.dart';
//import 'package:smart_change/Pages/welcome_home.dart';

import 'package:smart_change/screens/Tab%20bar%20screen/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAuth.instance.currentUser == null
          ? const Center(child: LoginPage())
          : const SmartChangeAppBottom(),
      // body: StreamBuilder<User?>(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return const OnBoardingScreen();
      //       } else {
      //         return const Center(child: LoginPage());
      //       }
      //     },),
    );
  }
}
