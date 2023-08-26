// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_change/Models/message_models.dart';
import 'package:smart_change/Models/user_model.dart';
import 'package:smart_change/chat_screen.dart';
import 'package:smart_change/components/chat_tile.dart';
import 'package:smart_change/models/chat_model.dart';

import '../utilis/dimensions.dart';

class TradeChatPage extends StatefulWidget {
  const TradeChatPage({super.key});

  @override
  State<TradeChatPage> createState() => _TradeChatPageState();
}

class _TradeChatPageState extends State<TradeChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: 360,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Text(
              'Trade Chats',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueGrey[900],
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 35,
                  width: 280,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'search messages here...',
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.blueGrey.shade900.withOpacity(0.2),
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey.shade900.withOpacity(0.2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.blueGrey.shade900.withOpacity(0.2),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("_chats").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  }
                  if (!snapshot.hasData) {
                    // Collection is empty
                    return const Center(child: Text("Empty"));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Text("Loading..."));
                  }

                  List<DocumentSnapshot> documents = snapshot.data!.docs.where((element) => ChatCollectionModel.fromMap(element.data() as Map<String, dynamic>).userId == FirebaseAuth.instance.currentUser!.uid).toList();

                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final doc = documents[index];
                      final chat = ChatCollectionModel.fromMap(
                          doc.data() as Map<String, dynamic>);

                      return ChatTile(chat: chat);
                    },
                  );
                },
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: chats.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         final Message chat = chats[index];
            //         return GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => ChatScreen(chatroomID: '')),
            //             );
            //           },
            //           child: Row(
            //             children: <Widget>[
            //               Container(
            //                 padding: const EdgeInsets.all(2),
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(40),
            //                     border:
            //                         Border.all(width: 2, color: Colors.grey)),
            //                 child: CircleAvatar(
            //                   backgroundColor: Colors.grey[200],
            //                   radius: 18,
            //                   backgroundImage: AssetImage(chat.sender.imageUrl),
            //                 ),
            //               ),
            //               Container(
            //                 width: 270,
            //                 //width: MediaQuery.of(context).size.width * 0.2,
            //                 padding: const EdgeInsets.only(left: 15),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: <Widget>[
            //                     Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: <Widget>[
            //                         Row(
            //                           children: [
            //                             Text(
            //                               chat.sender.name,
            //                               style: TextStyle(
            //                                   fontSize: 13,
            //                                   fontWeight: FontWeight.w900,
            //                                   color: Colors.blueGrey.shade700),
            //                             ),
            //                             chat.sender.isOnline
            //                                 ? Container(
            //                                     margin: const EdgeInsets.only(
            //                                         left: 5),
            //                                     width: 7,
            //                                     height: 7,
            //                                     decoration: const BoxDecoration(
            //                                         shape: BoxShape.circle,
            //                                         color: Colors.green),
            //                                   )
            //                                 : Container(
            //                                     child: null,
            //                                   )
            //                           ],
            //                         ),
            //                         Container(
            //                           alignment: Alignment.topRight,
            //                           height: 22,
            //                           width: 80,
            //                           decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(7),
            //                             border: Border.all(
            //                               color: Colors.grey.shade300,
            //                               width: 2,
            //                             ),
            //                           ),
            //                           child: Center(
            //                             child: Text(
            //                               chat.time,
            //                               style: TextStyle(
            //                                   fontSize: 9,
            //                                   fontWeight: FontWeight.w400,
            //                                   color: Colors.blueGrey.shade700),
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     const SizedBox(
            //                       height: 3,
            //                     ),
            //                     Text(
            //                       overflow: TextOverflow.ellipsis,
            //                       maxLines: 1,
            //                       chat.text,
            //                       style: TextStyle(
            //                           fontSize: 9,
            //                           fontWeight: FontWeight.w500,
            //                           color: Colors.blueGrey.shade700),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 60,
            //               )
            //             ],
            //           ),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
