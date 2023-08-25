import 'package:flutter/material.dart';
import 'package:smart_change/components/card1.dart';
import 'package:smart_change/components/card2.dart';
import 'package:smart_change/components/mini_cards.dart';
import 'package:smart_change/providers/user.dart';
import 'package:smart_change/utilis/app_colors.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';


class WelcomeHomePage extends StatefulWidget {
  const WelcomeHomePage({super.key});

  @override
  State<WelcomeHomePage> createState() => _WelcomeHomePageState();
}

class _WelcomeHomePageState extends State<WelcomeHomePage> {
  int _currpage = 0;
  final pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currpage < 3) {
        _currpage++;
      } else {
        _currpage = 0;
      }

      pageController.animateToPage(_currpage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int index) {
    setState(() {
      _currpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery.sizeOf(context);
    final user = context.watch<UserProvider>().user;
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.grey.shade100,
        ),
        child: Column(
          children: [
            Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(user?.photoUrl ?? ""),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
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
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.username ?? "",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            'Online',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade400),
                            selectionColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Icons.circle_rounded,
                    size: 11,
                    color: AppColors.ClickableBottonColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Updates',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: Container(
                child: PageView(
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  scrollDirection: Axis.horizontal,
                  children: const [CardOne(), CardTwo(), CardOne(), CardTwo()],
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey.shade700,
                  dotHeight: 6,
                  dotWidth: 6),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.star_rounded,
                  color: AppColors.ClickableBottonColor,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Starred merchants",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  MiniCards(),
                  SizedBox(
                    width: 12,
                  ),
                  MiniCards(),
                  SizedBox(
                    width: 12,
                  ),
                  MiniCards(),
                  SizedBox(
                    width: 12,
                  ),
                  MiniCards(),
                  SizedBox(
                    width: 12,
                  ),
                  MiniCards(),
                  SizedBox(
                    width: 12,
                  ),
                  MiniCards(),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
          ],
        ),
      ),
    ));
  }
}
