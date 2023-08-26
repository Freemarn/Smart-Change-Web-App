import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_change/Pages/merchant_page.dart';
import 'package:smart_change/components/seetings_container.dart';
import 'package:smart_change/providers/user.dart';
import 'package:smart_change/utilis/app_colors.dart';
import '../components/orange_button.dart';
import '../screens/Tab bar screen/additional_in_app.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void signOutUser() {
    FirebaseAuth.instance.signOut();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserProvider>().user;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              'Settings',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey[900]),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              width: 330,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration:  BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                             user?.photoUrl ?? "assets/images/free.jpeg"))),
                                ),
                                Positioned(
                                    right: 0,
                                    bottom: 5,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                 user?.username ?? "",
                                  style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Online',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade400),
                                  selectionColor: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Accepts : ',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey[900]),
                          ),
                          Container(
                            height: 17,
                            width: 37,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColors.FooterImageBorderColor)),
                            child: Center(
                              child: Text(
                                'ALGOS',
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            height: 17,
                            width: 37,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColors.FooterImageBorderColor)),
                            child: Center(
                              child: Text(
                                'CSA',
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            height: 17,
                            width: 37,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColors.FooterImageBorderColor)),
                            child: Center(
                              child: Text(
                                'NGN',
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            height: 17,
                            width: 37,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColors.FooterImageBorderColor)),
                            child: Center(
                              child: Text(
                                'USDT',
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 2,
                    height: 100,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, top: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_half_rounded,
                              color: AppColors.ClickableBottonColor,
                              size: 23,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 1.5,
                              height: 20,
                              color: AppColors.FooterImageBorderColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '+4.5',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.blueGrey[900]),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(95),
                              color: Colors.grey[100],
                              border: Border.all(
                                  color: AppColors.FooterImageBorderColor)),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'View Reviews',
                                style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  openDialog();
                },
                child: SettingsContainers(
                  text: 'Edit Profile',
                  imageUrl: 'assets/images/dit.png',
                )),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MerchantPage()));
                },
                child: SettingsContainers(
                  text: 'Manage Merchant Details',
                  imageUrl: 'assets/images/merch.png',
                )),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AdditionalInApp()));
                },
                child: SettingsContainers(
                  text: 'Security',
                  imageUrl: 'assets/images/safe.png',
                )),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {},
                child: SettingsContainers(
                  text: 'FAQ',
                  imageUrl: 'assets/images/double.png',
                )),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {},
                child: SettingsContainers(
                  text: 'Help',
                  imageUrl: 'assets/images/question.png',
                )),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  signOutUser();
                },
                child: SettingsContainers(
                  text: 'Sign Out',
                  imageUrl: 'assets/images/out.png',
                )),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  void openDialog() => showDialog(
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
                    hintText: 'User Name:',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number:',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Alternative Phone Number:',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'E-mail Address:',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Country:',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                )
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
