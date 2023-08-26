import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:smart_change/components/normal_button.dart';
import 'package:smart_change/components/orange_button.dart';

import 'package:smart_change/models/user_model.dart';
import 'package:smart_change/providers/user.dart';
import 'package:smart_change/screens/Tab%20bar%20screen/additional_secure.dart';

import 'package:smart_change/utilis/app_colors.dart';




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
try{
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
  final userResponse = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    print(userResponse.user);
    Navigator.pop(context);
    openDialog(context);

    if (userResponse.user != null) {
      print("Sign up successful");
      user.uid = userResponse.user!.uid ;
      await FirebaseFirestore.instance.collection("_users").add(user.toMap());

      

   
         
    }

    
}on FirebaseAuthException catch(e){
  Navigator.pop(context);
  showErrorMessage(e.code, context);

}

  } 


   void showErrorMessage(String message, context) {
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
