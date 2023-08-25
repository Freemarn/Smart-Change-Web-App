import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_change/providers/user.dart';

import '../Pages/notifications.dart';
import '../Pages/settings.dart';
import '../Pages/smart_swap.dart';
import '../Pages/trade_chat.dart';
import '../utilis/app_colors.dart';
import '../Pages/welcome_home.dart';

class SmartChangeAppBottom extends StatefulWidget {
  const SmartChangeAppBottom({super.key});

  @override
  State<SmartChangeAppBottom> createState() => _SmartChangeAppBottomState();
}

class _SmartChangeAppBottomState extends State<SmartChangeAppBottom> {
  int _pageIndex = 0;
  final List<Widget> _tablist = [
    const WelcomeHomePage(),
    const SmartSwapPage(),
    const TradeChatPage(),
    const NotificationsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var userProvider = context.read<UserProvider>();
     

          return SingleChildScrollView(
            child: Material(
              child: Center(
                  child: SizedBox(
                height: 650,
                width: 370,
                child: Stack(
                  children: [
                    _tablist.elementAt(_pageIndex),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 35),
                      child: Align(
                        alignment: const Alignment(0.0, 0.95),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BottomNavigationBar(
                              selectedItemColor: Colors.blueGrey[900],
                              unselectedItemColor:
                                  AppColors.FooterImageBorderColor,
                              showSelectedLabels: true,
                              showUnselectedLabels: false,
                              backgroundColor: Colors.grey[200],
                              currentIndex: _pageIndex,
                              onTap: (int index) {
                                setState(() {
                                  _pageIndex = index;
                                });
                              },
                              items: const [
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.home_outlined, size: 20),
                                  label: 'Home',
                                ),
                                BottomNavigationBarItem(
                                    icon: Icon(Icons.swap_horiz_rounded,
                                        size: 20),
                                    label: 'Smart swap'),
                                BottomNavigationBarItem(
                                    icon: Icon(
                                      Icons.chat,
                                      size: 20,
                                    ),
                                    label: 'Tradechat'),
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.notification_add_outlined,
                                      size: 20),
                                  label: 'Notifications',
                                ),
                                BottomNavigationBarItem(
                                    icon: Icon(
                                      Icons.settings,
                                      size: 20,
                                    ),
                                    label: 'Settings'),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
          );
        
  }
}
