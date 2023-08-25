import 'package:flutter/material.dart';
import 'package:smart_change/components/small_cards.dart';
import 'package:smart_change/utilis/app_colors.dart';

class MerchantPage extends StatefulWidget {
  const MerchantPage({super.key});

  @override
  State<MerchantPage> createState() => _MerchantPageState();
}

class _MerchantPageState extends State<MerchantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 650,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Merchant Settings',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: AppColors.ClickableBottonColor,
                            borderRadius: BorderRadiusDirectional.circular(50)),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        'Manage Exchange Rate',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 11, 44, 12),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 240,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: AppColors.FooterImageBorderColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Exchange Rates',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 11, 44, 12),
                              fontWeight: FontWeight.w700),
                        ),
                        //SizedBox()
                        const Text(
                          'Please enter your desired rates here...',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 11, 44, 12),
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    )),
                                child: Image.asset(
                                  'assets/images/csa1.png',
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'CSA',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 11, 44, 12),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 265,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppColors.FooterImageBorderColor,
                                      width: 2)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, right: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 13,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Center(
                                            child: Text(
                                              'Algo- 1',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.blueGrey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          '465.00',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(255, 11, 44, 12),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          width: 60,
                                          color:
                                              AppColors.FooterImageBorderColor,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 22),
                                      child: Container(
                                        width: 1,
                                        height: 45,
                                        color: AppColors.FooterImageBorderColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 13,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Center(
                                            child: Text(
                                              'Algo- 1',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.blueGrey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          '500.00',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(255, 11, 44, 12),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          width: 60,
                                          color:
                                              AppColors.FooterImageBorderColor,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 22),
                                      child: Container(
                                        width: 1,
                                        height: 45,
                                        color: AppColors.FooterImageBorderColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 13,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Center(
                                            child: Text(
                                              'Algo- 1',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.blueGrey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          '364.00',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(255, 11, 44, 12),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          width: 60,
                                          color:
                                              AppColors.FooterImageBorderColor,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    )),
                                child: Image.asset('assets/images/algo1.png')),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Algo',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 11, 44, 12),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 265,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppColors.FooterImageBorderColor,
                                      width: 2)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, right: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 13,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Center(
                                            child: Text(
                                              'Algo- 1',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.blueGrey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          '875.00',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(255, 11, 44, 12),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          width: 60,
                                          color:
                                              AppColors.FooterImageBorderColor,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 22),
                                      child: Container(
                                        width: 1,
                                        height: 45,
                                        color: AppColors.FooterImageBorderColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 13,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Center(
                                            child: Text(
                                              'Algo- 1',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.blueGrey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          '233.00',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(255, 11, 44, 12),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          width: 60,
                                          color:
                                              AppColors.FooterImageBorderColor,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 22),
                                      child: Container(
                                        width: 1,
                                        height: 45,
                                        color: AppColors.FooterImageBorderColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 13,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Center(
                                            child: Text(
                                              'Algo- 1',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.blueGrey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          '674.00',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(255, 11, 44, 12),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          width: 60,
                                          color:
                                              AppColors.FooterImageBorderColor,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: AppColors.ClickableBottonColor,
                            borderRadius: BorderRadiusDirectional.circular(50)),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        'Manage Wallets',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 11, 44, 12),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 270),
                  child: Text(
                    'Wallet Address:',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[500]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 51),
                  child: Text(
                    'People will use this wallet address information to send payments\nto you...',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[500]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      SmallCards(
                          textSmall: 'Algorand',
                          textBig: 'Algo',
                          smaallTextSize: 12,
                          imageUrl: 'assets/images/algo.png'),
                      SizedBox(
                        width: 10,
                      ),
                      SmallCards(
                          textSmall: 'Tether(USD)',
                          textBig: 'USDT',
                          smaallTextSize: 9,
                          imageUrl: 'assets/images/usdt.png'),
                      SizedBox(
                        width: 10,
                      ),
                      SmallCards(
                          textSmall: 'Algorand',
                          textBig: 'CSA',
                          smaallTextSize: 12,
                          imageUrl: 'assets/images/csa.png'),
                      SizedBox(
                        width: 10,
                      ),
                      SmallCards(
                          textSmall: 'Zenith Bank',
                          textBig: 'NGN',
                          smaallTextSize: 10,
                          imageUrl: 'assets/images/naira.png'),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 310),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 6, 63, 8),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
