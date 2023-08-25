import 'dart:convert';

import 'package:smart_change/models/user_model.dart';

class MessageTile {
  String photoUrl;
  String senderId;
  String time;
  String msg;
  MessageTile({
    required this.photoUrl,
    required this.senderId,
    required this.time,
    required this.msg,
  });
 

  MessageTile copyWith({
    String? photoUrl,
    String? senderId,
    String? time,
    String? msg,
  }) {
    return MessageTile(
      photoUrl: photoUrl ?? this.photoUrl,
      senderId: senderId ?? this.senderId,
      time: time ?? this.time,
      msg: msg ?? this.msg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'photoUrl': photoUrl,
      'senderId': senderId,
      'time': time,
      'msg': msg,
    };
  }

  factory MessageTile.fromMap(Map<String, dynamic> map) {
    return MessageTile(
      photoUrl: map['photoUrl'] ?? '',
      senderId: map['senderId'] ?? '',
      time: map['time'] ?? '',
      msg: map['msg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageTile.fromJson(String source) => MessageTile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessageTile(photoUrl: $photoUrl, senderId: $senderId, time: $time, msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MessageTile &&
      other.photoUrl == photoUrl &&
      other.senderId == senderId &&
      other.time == time &&
      other.msg == msg;
  }

  @override
  int get hashCode {
    return photoUrl.hashCode ^
      senderId.hashCode ^
      time.hashCode ^
      msg.hashCode;
  }
}

class Message {
  final UserModel sender;
  final String time;
  final String text;
  final bool unread;
  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });

  Map<String, dynamic> toMap() {
    return {
      'sender': sender.toMap(),
      'time': time,
      'text': text,
      'unread': unread,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      sender: UserModel.fromMap(map['sender']),
      time: map['time'] ?? '',
      text: map['text'] ?? '',
      unread: map['unread'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Message(sender: $sender, time: $time, text: $text, unread: $unread)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.sender == sender &&
        other.time == time &&
        other.text == text &&
        other.unread == unread;
  }

  @override
  int get hashCode {
    return sender.hashCode ^ time.hashCode ^ text.hashCode ^ unread.hashCode;
  }
}

// //Example chats on screen
// final List<Message> chats = [
//   Message(
//       sender: currentUser,
//       time: '12-Jan-23',
//       text:
//           'Hello maggi how are and hope your are doing great Hello maggi how are and hope your are doing great',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '1:34 am',
//       text: 'I got some nfts for a thousand Btc',
//       unread: true),
//   Message(
//       sender: manGreg,
//       time: '2:30 pm',
//       text:
//           'lets go grinding with travis, he is got a concert on the metaverse',
//       unread: true),
//   Message(
//       sender: peeFreeman,
//       time: '2:16 pm',
//       text: 'Hello mandara how is it going?',
//       unread: false),
//   Message(
//       sender: chloeVinick,
//       time: '5:18 am',
//       text: 'Yo I got some USDT from the morning tournament, up for sale',
//       unread: false),
//   Message(
//       sender: minCook,
//       time: '9:16 pm',
//       text: 'Hope is not going to be mad at you for selling your crypto?',
//       unread: true),
//   Message(
//       sender: cullNancy,
//       time: '2:06 pm',
//       text: 'lets go snow gliding, its just 800 usd',
//       unread: false),
//   Message(
//       sender: damPeever,
//       time: '12:13 pm',
//       text: 'wow! I love your service',
//       unread: true),
// ];

// //Example chats on chat screen
// final List<Message> messages = [
//   Message(
//       sender: currentUser, time: '11:15 am', text: 'Hello jeff?', unread: true),
//   Message(
//       sender: jeffWright, time: '1:34 pm', text: 'I am good man', unread: true),
//   Message(
//       sender: currentUser,
//       time: '1:50 pm',
//       text: 'chloe said she needs some algo, can you sell for 500 CSA?',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '2:15 pm',
//       text:
//           'Meanwhile, I have got somone who is willing to buy bulk CSA for 1k dollar',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:00 pm',
//       text: 'let me know if you want naira or USDT please',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:34 pm',
//       text: 'sure man, thanks bro',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:34 pm',
//       text: 'sure man, thanks bro',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:34 pm',
//       text: 'sure man, thanks bro',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:34 pm',
//       text: 'sure man, thanks bro',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:34 pm',
//       text: 'sure man, thanks bro',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:34 pm',
//       text: 'sure man, thanks bro',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:34 pm',
//       text: 'sure man, thanks bro',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:34 pm',
//       text: 'sure man, thanks bro',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
//   Message(
//       sender: jeffWright,
//       time: '3:34 pm',
//       text: 'sure man, thanks bro',
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '2:20 pm',
//       text:
//           'Thats a gret deal man, and yes I have got CSA, you can pay to my p2p account please',
//       unread: true),
// ];
