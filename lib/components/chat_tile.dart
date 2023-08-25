import 'package:flutter/material.dart';

import '../chat_screen.dart';
import '../models/chat_model.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key, required this.chat,
  }) : super(key: key);

  final ChatCollectionModel chat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(chatroomInfo: chat),
          ),
        );
      },
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(width: 2, color: Colors.grey)),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 18,
              backgroundImage: AssetImage(chat.displayPictureURL),
            ),
          ),
          Container(
            width: 270,
            //width: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          chat.displayName,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: Colors.blueGrey.shade700),
                        ),
                        chat.isOnline
                            ? Container(
                                margin: const EdgeInsets.only(left: 5),
                                width: 7,
                                height: 7,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              )
                            : Container(
                                child: null,
                              )
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      height: 22,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: Colors.grey.shade300, width: 2)),
                      child: Center(
                        child: Text(
                          chat.recentMesgTime.toString(),
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey.shade700),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  chat.recentMesg,
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey.shade700),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
