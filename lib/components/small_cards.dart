import 'package:flutter/material.dart';
import 'package:smart_change/utilis/app_colors.dart';

class SmallCards extends StatefulWidget {
  final String textSmall;
  final String textBig;
  final String imageUrl;
  final double smaallTextSize;
  
  const SmallCards({super.key,  required this.textSmall, required this.textBig,  required this.smaallTextSize, required this.imageUrl, });

  @override
  State<SmallCards> createState() => _SmallCardsState();
}

class _SmallCardsState extends State<SmallCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: 245,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.FooterImageBorderColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                    border:Border.all(color: AppColors.FooterImageBorderColor),
                   //shape: BoxShape.circle,
                                      image:  DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              widget.imageUrl),
                )),
                
                 
               
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.textBig,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.textSmall,
                    style: TextStyle(
                        fontSize: widget.smaallTextSize,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                width: 70,
              ),
              Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300]),
                child: const Icon(Icons.qr_code,
                    color: Color.fromARGB(255, 11, 44, 12), size: 25),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Container(
                height: 35,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: const Center(
                    child: Text(
                  'hrw02if74hrkl35jgdtd7339',
                  style: TextStyle(
                      color: Color.fromARGB(255, 11, 44, 12),
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.FooterImageBorderColor,
                    )),
                child: Center(
                  child: Text(
                    'Edit',
                    style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 11,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 190,
            height: 30,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.ClickableBottonColor.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 5,
                )
              ],
              borderRadius: BorderRadius.circular(25),
              color: AppColors.ClickableBottonColor,
            ),
            child: GestureDetector(
              onTap: () {},
              child: const Center(
                child: Text(
                  'Copy',
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
    );
  }
}
