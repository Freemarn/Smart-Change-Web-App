import 'package:flutter/material.dart';

class CardTwo extends StatelessWidget {
  const CardTwo({super.key});

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
                          text: 'Official ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueGrey.shade800.withOpacity(0.6)),
                          children: [
                        TextSpan(
                            text: 'Global',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.blueGrey.shade900.withOpacity(0.7)))
                      ])),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'Money ',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey.shade900
                                      .withOpacity(0.7)),
                              children: [
                            TextSpan(
                                text: 'Week',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey.shade900
                                        .withOpacity(0.7)))
                          ])),
                    ],
                  ),
                  RichText(
                      text: TextSpan(
                    text: 'Sponsor',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey.shade800.withOpacity(0.6)),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
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
                                'See More',
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
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Image(
                          image: AssetImage('assets/images/homecard.png')))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
