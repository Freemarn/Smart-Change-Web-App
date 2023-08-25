import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../components/input_field.dart';
import '../../components/mini_input_field.dart';
import '../../components/orange_button.dart';
import '../../utilis/app_colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController otpdController = TextEditingController();
  late int counter = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otpdController.dispose();
    super.dispose();
  }

  String email = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: counter == 0
                  ? Center(
                      child: Container(
                        height: 500,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: SizedBox(
                          height: size.height * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                  "Please, enter your email address to continue.."),
                              SizedBox(height: size.height * 0.05),
                              InputField(
                                onChange: (value) {
                email = value;
              },
                                text: 'Email address',
                                textSize: 15,
                                Iconcolor: AppColors.IconColor,
                                imageUrl: 'assets/images/at.png'
                              ),
                              SizedBox(height: size.height * 0.05),
                              OrangeButton(
                                text: 'Continue',
                                onPress: () {
                                  setState(() {
                                    counter = 1;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : counter == 1
                      ? Center(
                          child: Container(
                            height: 500,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: SizedBox(
                              height: size.height * 0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Enter the 4-digit code you received',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MiniInputField(),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        MiniInputField(),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        MiniInputField(),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        MiniInputField(),
                                        SizedBox(
                                          width: 7,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  OrangeButton(
                                    text: 'Continue',
                                    onPress: () {
                                      setState(() {
                                        //openDialog();
                                        
                                        counter = 2;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container())),
    );
  }

  // void openDialog() => showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         backgroundColor: Colors.white,
  //         title: const Center(
  //             child: Text(
  //           'Reset Password',
  //         )),
  //         content: const SizedBox(
  //           height: 90,
  //           width: 200,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Center(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   //mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     SizedBox(
  //                       height: 30,
  //                       width: 160,
  //                       child: TextField(
  //                         decoration: InputDecoration(
  //                           hintText: 'Enter Password',
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 15,
  //                     ),
  //                     SizedBox(
  //                       height: 30,
  //                       width: 160,
  //                       child: TextField(
  //                         decoration:
  //                             InputDecoration(hintText: 'Confirm Password'),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           GestureDetector(
  //               onTap: () {
  //                 setState(() {});
  //               },
  //               child: OrangeButton(
  //                 text: 'Reset Password',
  //                 onPress: () {
  //                   Navigator.of(context).push(MaterialPageRoute(
  //                       builder: (context) => const SuccessMessage()));
  //                 },
  //               ))
  //         ],
  //       ),
  //     );

       Future verifyEmail() async {
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

         try{
       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
       Navigator.of(context).popUntil((route) => route.isFirst);
     } on FirebaseAuthException catch(e){
      print(e);

     }


       
        
      } 

       

    
}
