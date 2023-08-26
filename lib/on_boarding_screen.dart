// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:smart_change/components/nav_bar.dart';

import 'package:smart_change/intro_screens/intro_screen_1.dart';
import 'package:smart_change/intro_screens/intro_screen_2.dart';
import 'package:smart_change/intro_screens/intro_screen_3.dart';
import 'package:smart_change/intro_screens/intro_screen_4.dart';
import 'package:smart_change/intro_screens/intro_screen_5.dart';

import 'package:smart_change/utilis/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  bool onLastPage = false;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
      child: Center(
            child: Container(
              height: 657,
              width: 450,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Stack(

                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        onLastPage = (index == 4);
                      });
                    },
                    children: const [
                      IntroScreenOne(),
                      IntroScreenTwo(),
                      IntroScreenThree(),
                      IntroScreenFour(),
                      IntroScreenFive()
                    ],
                  ),
                  Container(
                    alignment: const Alignment(0, 0.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            pageController.jumpToPage(4);
                          },
                          child: Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 11, 44, 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: 5,
                          effect: const SlideEffect(
                              dotColor: AppColors.FooterImageBorderColor,
                              activeDotColor: Color.fromARGB(255, 11, 44, 12),
                              dotHeight: 10,
                              dotWidth: 10),
                        ),
                        onLastPage
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SmartChangeAppBottom()));
                                },
                                child: Container(
                                  height: 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 11, 44, 12),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ))
                            : GestureDetector(
                                onTap: () {
                                  pageController.nextPage(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                child: Container(
                                  height: 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 11, 44, 12),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
      ),
    );
          }
        ));
  }
}
