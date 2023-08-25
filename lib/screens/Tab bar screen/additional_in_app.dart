// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:smart_change/Pages/settings.dart';
import 'package:smart_change/components/nav_bar.dart';
import 'package:smart_change/on_boarding_screen.dart';
import 'package:smart_change/utilis/app_colors.dart';
import '../../../../components/mini_input_field.dart';
import '../../../../components/normal_button.dart';
import '../../../../components/orange_button.dart';

class AdditionalInApp extends StatefulWidget {
  const AdditionalInApp({
    super.key,
  });

  @override
  State<AdditionalInApp> createState() => _AdditionalInAppState();
}

class _AdditionalInAppState extends State<AdditionalInApp> {
  bool val1 = false;
  onChangeFunction1(bool noValue1) {
    val1 = noValue1;
    setState(() {
      if (val1) openDialog2();
    });
  }

  bool val2 = false;
  onChangeFunction2(bool noValue2) {
    val2 = noValue2;
    setState(() {
      if (val2) openDialog3();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 657,
            width: 450,
            decoration: BoxDecoration(
                color: AppColors.FooterImageBgColor,
                borderRadius: BorderRadiusDirectional.circular(15)),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Additional \n  Security',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 27),
                          child: Text(
                            '.',
                            style: TextStyle(
                                fontSize: 50,
                                color: AppColors.ClickableBottonColor),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Complete the steps',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      openDialog4();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Container(
                        height: 55,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.lock,
                                size: 27, color: Color.fromARGB(255, 6, 63, 8)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Chnage Password',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 6, 63, 8)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      height: 55,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.lock,
                              size: 27, color: Color.fromARGB(255, 6, 63, 8)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Two Factor Authentication',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 6, 63, 8)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          customSwith(val1, onChangeFunction1)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      height: 55,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.fingerprint_outlined,
                              size: 30, color: Color.fromARGB(255, 6, 63, 8)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Biometrics',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 6, 63, 8)),
                          ),
                          const SizedBox(
                            width: 110,
                          ),
                          customSwith(val2, onChangeFunction2)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  OrangeButton(
                    text: 'Continue',
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 330),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 6, 63, 8),
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customSwith(bool val, Function onChangeMethod) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: CupertinoSwitch(
          trackColor: Colors.grey.shade200,
          activeColor: const Color.fromARGB(255, 6, 63, 8),
          value: val,
          onChanged: (noValue) {
            onChangeMethod(noValue);
          },
        ));
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Column(
            children: [
              Icon(
                Icons.warning_amber_outlined,
                size: 60,
                color: AppColors.ClickableBottonColor,
              ),
              Text(
                'Warning',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    color: Color.fromARGB(255, 11, 44, 12)),
              )
            ],
          ),
          content: const SizedBox(
            height: 90,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '   You have not completed the \nadditional security process. This\ncan make you vulnerable to attacks',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 11, 44, 12)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: ColourlessButton(
                      text: 'Skip',
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OnBoardingScreen()));
                      },
                    )),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: OrangeButton(
                      text: 'Go Back',
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                    )),
              ],
            )
          ],
        ),
      );

  void openDialog1() => showDialog(
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
                          '  Include additional security features\nto protect your account from external\n   threats and unauthorized activities',
                          style: TextStyle(
                              fontSize: 11,
                              color: Color.fromARGB(255, 11, 44, 12),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
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
                    onTap: () {
                      setState(() {});
                    },
                    child: OrangeButton(
                      text: 'Continue',
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                    )),
              ],
            )
          ],
        ),
      );

  void openDialog2() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 270,
            width: 250,
            child: Column(children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: const Color.fromARGB(255, 11, 44, 12),
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.lock,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Please enter your valid phone number to\n     receive an authentication code',
                style: TextStyle(
                    fontSize: 11,
                    color: Color.fromARGB(255, 11, 44, 12),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 45,
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Phone | +234',
                      filled: true,
                      fillColor: AppColors.fillColor,
                      hintStyle: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 11, 44, 12),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto'),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 2, color: AppColors.fillColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter 4 Digit code here',
                style: TextStyle(
                    fontSize: 11,
                    color: Color.fromARGB(255, 11, 44, 12),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MiniInputField(),
                  SizedBox(
                    width: 10,
                  ),
                  MiniInputField(),
                  SizedBox(
                    width: 10,
                  ),
                  MiniInputField(),
                  SizedBox(
                    width: 10,
                  ),
                  MiniInputField()
                ],
              )
            ]),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: OrangeButton(
                  text: 'Finish',
                  onPress: () {
                    Navigator.of(context).pop();
                  },
                ))
          ],
        ),
      );
  Future openDialog3() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 120,
            width: 200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: const Color.fromARGB(255, 11, 44, 12),
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.fingerprint_outlined,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      color: const Color.fromARGB(255, 11, 44, 12),
                      height: 50,
                      width: 2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: const Color.fromARGB(255, 11, 44, 12),
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.face_5_rounded,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '      Confirm Biometrics\nRegister fingerprint of Face ID',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color.fromARGB(255, 11, 44, 12),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: OrangeButton(
                  text: 'Finish',
                  onPress: () {
                    Navigator.of(context).pop();
                  },
                ))
          ],
        ),
      );

  void openDialog4() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 330,
            width: 200,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.blueGrey.shade900,
                      )),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 35,
                    color: Colors.blueGrey[900],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'New Password:',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'New Password:',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password:',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: OrangeButton(
                  text: 'Update',
                  onPress: () {
                    Navigator.of(context).pop();
                  },
                ))
          ],
        ),
      );
}
