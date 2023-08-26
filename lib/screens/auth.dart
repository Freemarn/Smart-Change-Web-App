import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_change/components/nav_bar.dart';
import 'package:smart_change/models/user_model.dart';
//import 'package:smart_change/components/normal_button.dart';
//import 'package:smart_change/components/orange_button.dart';
import 'package:smart_change/on_boarding_screen.dart';
import 'package:smart_change/providers/user.dart';
//import 'package:smart_change/screens/Tab%20bar%20screen/additional_secure.dart';
//import 'package:smart_change/Pages/welcome_home.dart';

import 'package:smart_change/screens/Tab%20bar%20screen/login_page.dart';
//import 'package:smart_change/utilis/app_colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FirebaseAuth.instance.currentUser == null
      //     ? const Center(child: LoginPage())
      //     : const SmartChangeAppBottom(),
      // body: StreamBuilder<User?>(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         //openDialog(context);
      //         return const OnBoardingScreen();
      //       } else {
      //         return const Center(child: LoginPage());
      //       }
      //     },),

      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (context.read<UserProvider>().user != null) {
              return const OnBoardingScreen();
            }
            return StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("_users").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final documents = snapshot.data!.docs;

                  for (var doc in documents) {
                    var user =
                        UserModel.fromMap(doc.data() as Map<String, dynamic>);
                    if (FirebaseAuth.instance.currentUser!.uid == user.uid) {
                      context.read<UserProvider>().user = user;
                    }
                  }
                  return const SmartChangeAppBottom();
                }

                return const Center(child: LoginPage());
              },
            );
          } else {
            return const Center(child: LoginPage());
          }
        },
      ),);

  }


  //  void openDialog(context) => showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         backgroundColor: Colors.white,
  //         title: const Center(
  //           child: Text(
  //             'Include Additional Security',
  //             style: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w700,
  //                 fontFamily: 'Roboto',
  //                 color: Color.fromARGB(255, 11, 44, 12)),
  //           ),
  //         ),
  //         content: const SizedBox(
  //           height: 180,
  //           width: 250,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Center(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Icon(
  //                       Icons.security_outlined,
  //                       size: 60,
  //                       color: AppColors.ClickableBottonColor,
  //                     ),
  //                     SizedBox(height: 30),
  //                     Center(
  //                       child: Text(
  //                         '   Include additional security features\nto protect your account from external\n   threats and unauthorized activities',
  //                         style: TextStyle(
  //                             fontSize: 11,
  //                             fontWeight: FontWeight.w400,
  //                             fontFamily: 'Roboto',
  //                             color: Color.fromARGB(255, 11, 44, 12)),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 12,
  //               )
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           Row(
  //             children: [
  //               GestureDetector(
  //                   onTap: () {},
  //                   child: ColourlessButton(
  //                     text: 'Skip',
  //                     onPress: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                   )),
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               GestureDetector(
  //                   onTap: () {},
  //                   child: OrangeButton(
  //                     text: 'Continue',
  //                     onPress: () {
  //                       Navigator.of(context).push(MaterialPageRoute(
  //                           builder: (context) => const AdditionalSecure()));
  //                     },
  //                   )),
  //             ],
  //           )
  //         ],
  //       ),
  //     );
}
