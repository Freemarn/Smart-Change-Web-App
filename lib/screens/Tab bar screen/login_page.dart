// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:smart_change/screens/Tab%20bar%20screen/sign_in.dart';
import 'package:smart_change/screens/Tab%20bar%20screen/sign_up.dart';
import 'package:smart_change/utilis/app_colors.dart';
import '../../components/header_image.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  int active = 0;
  void setActive(int value) {
    setState(() {
      active = value;
    });
  }

  final List<String> texts = ['Sign In', 'Sign Up'];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
          width: 400,
          height: 657,
          //color: Colors.grey[100],
          child: SingleChildScrollView(
            child: Column(children: [
              const CryptoSmartLogo(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: texts
                      .map((e) => GestureDetector(
                            onTap: active == texts.indexOf(e)
                                ? null
                                : () => setActive(active == 0 ? 1 : 0),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: active == texts.indexOf(e)
                                    ? const Border(
                                        bottom: BorderSide(
                                        width: 3,
                                      ))
                                    : null,
                              ),
                              child: Text(e),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              active == 0 ? const SignIn() : const SignUp(),
              const SizedBox(
                height: 40,
              ),
            ]),
          )),
    );
  }
}
