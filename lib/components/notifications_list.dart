import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';

class NotificationsList extends StatefulWidget {
  final String text;
  final String num;

  const NotificationsList({super.key, required this.text, required this.num});

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width * 0.33,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.circle_rounded,
                  size: 11,
                  color: AppColors.ClickableBottonColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.003,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.005,
                ),
                Text(
                  widget.num,
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.03,
                    ),
              ],
            ),
            Container(
              child: const Icon(
                Icons.arrow_drop_down_rounded,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
