import 'package:flutter/material.dart';

class CardOne extends StatelessWidget {
  const CardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Join ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueGrey.shade800.withOpacity(0.6)),
                          children: [
                        TextSpan(
                            text: '\$CSA ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color:
                                    Colors.blueGrey.shade900.withOpacity(0.8))),
                        TextSpan(
                            text: 'Upscale',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color:
                                    Colors.blueGrey.shade900.withOpacity(0.7)))
                      ])),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'Lunchpad ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blueGrey.shade900
                                      .withOpacity(0.8)),
                              children: [
                            TextSpan(
                                text: 'Test',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blueGrey.shade800
                                        .withOpacity(0.6)))
                          ])),
                    ],
                  ),
                  RichText(
                      text: TextSpan(
                    text: 'Activities',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey.shade800.withOpacity(0.6)),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(95),
                      color: Colors.amber,
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Learn More',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 11,
                                    fontFamily: 'Roboto'),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  Container(
                      height: 125,
                      width: 175,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Image(
                          image: AssetImage('assets/images/3phone.png')))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
