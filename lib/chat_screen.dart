import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_change/providers/chats.dart';
//import 'package:smart_change/Models/message_models.dart';
import 'package:smart_change/utilis/app_colors.dart';
import 'models/chat_model.dart';
import 'models/message_models.dart';

import 'package:timeago/timeago.dart' as timeago;

class ChatScreen extends StatefulWidget {
  final ChatCollectionModel chatroomInfo;
  const ChatScreen({
    super.key,
    required this.chatroomInfo,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(
    MessageTile message,
    bool isMe, //bool isSameUser
  ) {
    if (isMe) {
      return Row(
        children: <Widget>[
          //isSameUser?
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 13,
                  backgroundImage: AssetImage(message.photoUrl),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  timeago.format(DateTime.parse(message.time)),
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                      color: Colors.green.shade200.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          //Container(child: null,),
          const SizedBox(
            width: 7,
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
              //maxWidth: MediaQuery.of(context).size.width * 0.15),
            ),
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.5))
                ]),
            child: Text(
              message.msg,
              style: const TextStyle(fontSize: 9),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
              // maxWidth: MediaQuery.of(context).size.width * 0.15
            ),
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.5))
                ]),
            child: Text(
              message.msg,
              style: const TextStyle(fontSize: 9),
            ),
          ),

          const SizedBox(
            width: 7,
          ),
          //isSameUser?
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 13,
                  backgroundImage: AssetImage(message.photoUrl),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  timeago.format(DateTime.parse(message.time)),
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                      color: Colors.green.shade200.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          // Container(child: null,)
        ],
      );
    }
  }

  final TextEditingController _editController = TextEditingController();
  String mesg = "";

  @override
  Widget build(BuildContext context) {
    //int prevUserId;
    return Center(
      child: Container(
        height: 650,
        width: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            AssetImage(widget.chatroomInfo.displayPictureURL),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.chatroomInfo.displayName,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: Colors.blueGrey.shade700)),
                      Row(
                        children: [
                          Text('Online',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey.shade700)),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 55,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 100),
                                child: Text(
                                  'Accepts : ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey[900]),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: AppColors
                                                .FooterImageBorderColor)),
                                    child: Center(
                                      child: Text(
                                        'ALGOS',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Colors.blueGrey[900],
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    height: 15,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: AppColors
                                                .FooterImageBorderColor)),
                                    child: Center(
                                      child: Text(
                                        'CSA',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Colors.blueGrey[900],
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    height: 15,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: AppColors
                                                .FooterImageBorderColor)),
                                    child: Center(
                                      child: Text(
                                        'NGN',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Colors.blueGrey[900],
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    height: 15,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: AppColors
                                                .FooterImageBorderColor)),
                                    child: Center(
                                      child: Text(
                                        'USDT',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Colors.blueGrey[900],
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 55,
                        width: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Text(
                                'Ratings: ',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.blueGrey.shade700,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                width: 55,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(95),
                                    color: Colors.grey[100],
                                    border: Border.all(
                                        color:
                                            AppColors.FooterImageBorderColor)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star_half_rounded,
                                        color: AppColors.ClickableBottonColor,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        width: 1.5,
                                        height: 10,
                                        color: AppColors.FooterImageBorderColor,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        '+4.5',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: Colors.blueGrey[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 55,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              children: [
                                Text(
                                  'Reviews: ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.blueGrey.shade700,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  width: 70,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(95),
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          color: AppColors
                                              .FooterImageBorderColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'View Reviews',
                                          style: TextStyle(
                                              color: Colors.blueGrey[900],
                                              fontWeight: FontWeight.w400,
                                              fontSize: 9,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 55,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              children: [
                                Text(
                                  'Wallet: ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.blueGrey.shade700,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  width: 70,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(95),
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          color: AppColors
                                              .FooterImageBorderColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'View Wallet',
                                          style: TextStyle(
                                              color: Colors.blueGrey[900],
                                              fontWeight: FontWeight.w400,
                                              fontSize: 9,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(widget.chatroomInfo.chatRoomId)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                                child: Text("Something went wrong"));
                          }
                          if (!snapshot.hasData) {
                            // Collection is empty
                            return const Center(child: Text("no chat"));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(child: Text("Loading..."));
                          }

                          List<DocumentSnapshot> messageDocuments =
                              snapshot.data!.docs.reversed.toList();

                          return ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: messageDocuments.length,
                            itemBuilder: (BuildContext context, int index) {
                              final doc = messageDocuments[index];
                              final uid =
                                  FirebaseAuth.instance.currentUser!.uid;

                              final messageInfo = MessageTile.fromMap(
                                  doc.data() as Map<String, dynamic>);

                              bool isMe = messageInfo.senderId == uid;
                              //final bool isSameUser = prevUserId  == message.sender.id;
                              //prevUserId = message.sender.id;
                              return _chatBubble(
                                messageInfo, isMe, //isSameUser
                              );
                            },
                          );
                        },
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 350,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey[100]),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        size: 17,
                                        color: Colors.grey[500],
                                      )),
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 200,
                                  child: TextFormField(
                                    onChanged: (value) => mesg = value,
                                    controller: _editController,
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey[100],
                                        filled: true,
                                        hintText: 'Send your message here...',
                                        hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w500),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.attachment_outlined,
                                            size: 15,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade100)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade100))),
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color.fromARGB(
                                          255, 11, 44, 12)),
                                  child: IconButton(
                                      onPressed: () async {
                                        final msgInfo = MessageTile(
                                          photoUrl: widget
                                              .chatroomInfo.displayPictureURL,
                                          senderId: widget.chatroomInfo.peerId,
                                          time: DateTime.now().toString(),
                                          msg: mesg,
                                        );

                                        await context
                                            .read<ChatProvider>()
                                            .sendMessage(
                                              context,
                                              widget.chatroomInfo.chatRoomId,
                                              msgInfo,
                                            );

                                        _editController.clear();

                                        mesg = "";
                                      },
                                      icon: const Icon(
                                        Icons.send,
                                        size: 17,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
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
