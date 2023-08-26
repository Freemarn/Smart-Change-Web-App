import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../components/input_field.dart';

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
              child: 
                   Center(
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
                                  resetPassword(email: email);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  
                      
                     )),
    );


    
  }

  
    Future<void> resetPassword({required String email}) async {
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
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.pop(context);
      
    
    } on FirebaseAuthException catch(e){
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