// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:smart_change/utilis/app_colors.dart';

class MiniCards extends StatelessWidget {
  const MiniCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 155,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          const SizedBox(
            height: 17,
          ),
          const CircleAvatar(
            backgroundColor: AppColors.FooterImageBgColor,
            radius: 25,
            child: Icon(
              Icons.person,
              color: AppColors.FooterImageBorderColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Merchant\'s full name\n          Surname',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 11, 44, 12)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star_half_rounded,
                color: AppColors.ClickableBottonColor,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 2,
                height: 20,
                color: AppColors.FooterImageBorderColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '+4.5',
                style: TextStyle(fontSize: 15, color: Colors.grey[400]),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 25,
                  width: 28,
                  decoration: BoxDecoration(
                    color: AppColors.FooterImageBgColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle_rounded,
                        size: 5,
                        color: AppColors.FooterImageBorderColor,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 5,
                        color: AppColors.FooterImageBorderColor,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        size: 5,
                        color: AppColors.FooterImageBorderColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 110,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.amber,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: AppColors.ClickableBottonColor.withOpacity(0.2),
                    //     spreadRadius: 10,
                    //     blurRadius: 5,
                    //   )
                    // ]
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Message',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
