import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:smart_change/models/user_model.dart';
import 'package:smart_change/providers/user.dart';

import '../on_boarding_screen.dart';

class SignupProvider extends ChangeNotifier {
  Future<void> signup(BuildContext context, String username, String password,
      String phonenumber, String email) async {
    var rng = Random();

    final user = UserModel(
      username: username,
      email: email,
      phonenumber: phonenumber,
      photoUrl: 'assets/images/p${rng.nextInt(8) + 1}.jpeg',
      sellingPrice: "460",
      rating: (rng.nextInt(5) * rng.nextDouble()).toPrecision(2).toString(),
      trades: (rng.nextInt(20) + 15).toString(),
      complete: (rng.nextInt(10) + 90).toString(),
      duration: (rng.nextInt(20) + 15).toString(),
      isVerified: rng.nextBool(),
      isOnline: rng.nextBool(),
    );

    context.read<UserProvider>().user = user;

    final userResponse = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    print(userResponse.user);

    if (userResponse.user != null) {
      print("Sign up successful");
      user.uid = userResponse.user!.uid ;
      await FirebaseFirestore.instance.collection("_users").add(user.toMap());

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
    }
  }
}
