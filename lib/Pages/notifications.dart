import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 650,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Container(
          height: 80,
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.blueGrey,
                        )),
                    Text(
                      'Notifications',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey[900]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(50)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.message_rounded,
                                  size: 18,
                                )),
                          ),
                          Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orangeAccent,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notification_add_rounded,
                              size: 18,
                            )),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              size: 18,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const Icon(
                Icons.circle_rounded,
                size: 11,
                color: AppColors.ClickableBottonColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Recent Notification',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey.shade700,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                    height: 65,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              radius: 18,
                              backgroundImage:
                                  const AssetImage('assets/images/csa1.png'),
                            ),
                          ),
                          Container(
                            width: 270,
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tommy Hilfit',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.blueGrey.shade700),
                                    ),
                                    Text(
                                      '12:15 am',
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blueGrey.shade700),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      'Hello smith, can I get some bitcoin?',
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueGrey.shade700),
                                    ),
                                    const Icon(
                                      Icons.circle,
                                      size: 13,
                                      color: Colors.brown,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const Icon(
                Icons.circle_rounded,
                size: 11,
                color: AppColors.ClickableBottonColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Previous Notifications',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey.shade700,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                    height: 65,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              radius: 18,
                              backgroundImage:
                                  const AssetImage('assets/images/csa1.png'),
                            ),
                          ),
                          Container(
                            width: 270,
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tommy Hilfit',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.blueGrey.shade700),
                                    ),
                                    Text(
                                      '12:15 am',
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blueGrey.shade700),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      'Hello smith, can I get some bitcoin?',
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueGrey.shade700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ]),
    ));
  }
}
