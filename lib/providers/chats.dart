import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../chat_screen.dart';
import '../models/chat_model.dart';
import '../models/message_models.dart';

class ChatProvider extends ChangeNotifier {
  Future<void> sendMessage(
      context, String chatroomId, MessageTile mesgInfo) async {
    await FirebaseFirestore.instance.collection(chatroomId).add(mesgInfo.toMap());
  }

  Future<void> createChat(context, ChatCollectionModel newChat) async {
    // Check if the chat already exist
    // FirebaseFirestore.instance.collection("chats").snapshots()
    // .map((c) {
    //   c.docs.map((e) {
    //     var chat = ChatCollectionModel.fromMap(e.data());
    //     String chatroomId = newChat.peerId + newChat.userId;
    //     if (chat.chatRoomId == chatroomId) {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => ChatScreen(
    //             chatroomID: e.,
    //           ),
    //         ),
    //       );
    //       return;
    //     }
    //   });
    // });

    try {
      final response = await FirebaseFirestore.instance
          .collection("_chats")
          .add(newChat.toMap());

      ChatCollectionModel createdChatroom = newChat;
      createdChatroom.chatRoomId = response.id;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatScreen(
            chatroomInfo: newChat,
          ),
        ),
      );
    } catch (e) {
      print(e);
      // Failed to create a chat
    }
  }
}
