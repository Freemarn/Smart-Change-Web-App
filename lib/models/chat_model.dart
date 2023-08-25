import 'dart:convert';

class ChatCollectionModel {
  String chatRoomId;
  String displayName;
  String username;
  String displayPictureURL;
  String recentMesg;
  String peerId;
  String userId;
  DateTime recentMesgTime;
  bool isOnline;
  ChatCollectionModel({
    required this.chatRoomId,
    required this.displayName,
    required this.username,
    required this.displayPictureURL,
    required this.recentMesg,
    required this.peerId,
    required this.userId,
    required this.recentMesgTime,
    required this.isOnline,
  });
  

  ChatCollectionModel copyWith({
    String? chatRoomId,
    String? displayName,
    String? username,
    String? displayPictureURL,
    String? recentMesg,
    String? peerId,
    String? userId,
    DateTime? recentMesgTime,
    bool? isOnline,
  }) {
    return ChatCollectionModel(
      chatRoomId: chatRoomId ?? this.chatRoomId,
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      displayPictureURL: displayPictureURL ?? this.displayPictureURL,
      recentMesg: recentMesg ?? this.recentMesg,
      peerId: peerId ?? this.peerId,
      userId: userId ?? this.userId,
      recentMesgTime: recentMesgTime ?? this.recentMesgTime,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatRoomId': chatRoomId,
      'displayName': displayName,
      'username': username,
      'displayPictureURL': displayPictureURL,
      'recentMesg': recentMesg,
      'peerId': peerId,
      'userId': userId,
      'recentMesgTime': recentMesgTime.millisecondsSinceEpoch,
      'isOnline': isOnline,
    };
  }

  factory ChatCollectionModel.fromMap(Map<String, dynamic> map) {
    return ChatCollectionModel(
      chatRoomId: map['chatRoomId'] ?? '',
      displayName: map['displayName'] ?? '',
      username: map['username'] ?? '',
      displayPictureURL: map['displayPictureURL'] ?? '',
      recentMesg: map['recentMesg'] ?? '',
      peerId: map['peerId'] ?? '',
      userId: map['userId'] ?? '',
      recentMesgTime: DateTime.fromMillisecondsSinceEpoch(map['recentMesgTime']),
      isOnline: map['isOnline'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatCollectionModel.fromJson(String source) => ChatCollectionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatCollectionModel(chatRoomId: $chatRoomId, displayName: $displayName, username: $username, displayPictureURL: $displayPictureURL, recentMesg: $recentMesg, peerId: $peerId, userId: $userId, recentMesgTime: $recentMesgTime, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChatCollectionModel &&
      other.chatRoomId == chatRoomId &&
      other.displayName == displayName &&
      other.username == username &&
      other.displayPictureURL == displayPictureURL &&
      other.recentMesg == recentMesg &&
      other.peerId == peerId &&
      other.userId == userId &&
      other.recentMesgTime == recentMesgTime &&
      other.isOnline == isOnline;
  }

  @override
  int get hashCode {
    return chatRoomId.hashCode ^
      displayName.hashCode ^
      username.hashCode ^
      displayPictureURL.hashCode ^
      recentMesg.hashCode ^
      peerId.hashCode ^
      userId.hashCode ^
      recentMesgTime.hashCode ^
      isOnline.hashCode;
  }
}
