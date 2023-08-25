// class User {
//   final int id;
//   final String name;
//   final String imageUrl;
//   final bool isOnline;

//   User({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.isOnline,
//   });
// }

import 'dart:convert';

class UserModel {
  String uid;
  String username;
  String photoUrl;
  String phonenumber;
  String sellingPrice;
  String email;
  String rating;
  String trades;
  String complete;
  String duration;
  bool isVerified;
  bool isOnline;
  UserModel({
    this.uid = "",
    required this.username,
    required this.photoUrl,
    required this.phonenumber,
    required this.sellingPrice,
    required this.email,
    required this.rating,
    required this.trades,
    required this.complete,
    required this.duration,
    required this.isVerified,
    required this.isOnline,
  });

  UserModel copyWith({
    String? uid,
    String? username,
    String? photoUrl,
    String? phonenumber,
    String? sellingPrice,
    String? email,
    String? rating,
    String? trades,
    String? complete,
    String? duration,
    bool? isVerified,
    bool? isOnline,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      photoUrl: photoUrl ?? this.photoUrl,
      phonenumber: phonenumber ?? this.phonenumber,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      email: email ?? this.email,
      rating: rating ?? this.rating,
      trades: trades ?? this.trades,
      complete: complete ?? this.complete,
      duration: duration ?? this.duration,
      isVerified: isVerified ?? this.isVerified,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'photoUrl': photoUrl,
      'phonenumber': phonenumber,
      'sellingPrice': sellingPrice,
      'email': email,
      'rating': rating,
      'trades': trades,
      'complete': complete,
      'duration': duration,
      'isVerified': isVerified,
      'isOnline': isOnline,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
      sellingPrice: map['sellingPrice'] ?? '',
      email: map['email'] ?? '',
      rating: map['rating'] ?? '',
      trades: map['trades'] ?? '',
      complete: map['complete'] ?? '',
      duration: map['duration'] ?? '',
      isVerified: map['isVerified'] ?? false,
      isOnline: map['isOnline'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, username: $username, photoUrl: $photoUrl, phonenumber: $phonenumber, sellingPrice: $sellingPrice, email: $email, rating: $rating, trades: $trades, complete: $complete, duration: $duration, isVerified: $isVerified, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.username == username &&
        other.photoUrl == photoUrl &&
        other.phonenumber == phonenumber &&
        other.sellingPrice == sellingPrice &&
        other.email == email &&
        other.rating == rating &&
        other.trades == trades &&
        other.complete == complete &&
        other.duration == duration &&
        other.isVerified == isVerified &&
        other.isOnline == isOnline;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        username.hashCode ^
        photoUrl.hashCode ^
        phonenumber.hashCode ^
        sellingPrice.hashCode ^
        email.hashCode ^
        rating.hashCode ^
        trades.hashCode ^
        complete.hashCode ^
        duration.hashCode ^
        isVerified.hashCode ^
        isOnline.hashCode;
  }
}

// final UserModel currentUser = UserModel(
//   id: 0,
//   name: 'Andy Rusell',
//   imageUrl: 'assets/images/p1.jpeg',
//   isOnline: true,
// );

// final UserModel jeffWright = UserModel(
//     id: 1,
//     name: 'Jack Vowell',
//     imageUrl: 'assets/images/p2.jpeg',
//     isOnline: false);

// final UserModel manGreg = UserModel(
//     id: 2,
//     name: 'Val Bouten',
//     imageUrl: 'assets/images/p7.png',
//     isOnline: false);

// final UserModel minCook = UserModel(
//     id: 3,
//     name: 'Leo Mandara',
//     imageUrl: 'assets/images/p3.jpeg',
//     isOnline: true);

// final UserModel peeFreeman = UserModel(
//     id: 4,
//     name: 'Nine Tail',
//     imageUrl: 'assets/images/p4.jpeg',
//     isOnline: false);

// final UserModel chloeVinick = UserModel(
//     id: 5,
//     name: 'Jeff Jet',
//     imageUrl: 'assets/images/p5s.jpeg',
//     isOnline: false);

// final UserModel cullNancy = UserModel(
//     id: 6,
//     name: 'Wonder Hero',
//     imageUrl: 'assets/images/p7.png',
//     isOnline: false);

// final UserModel damPeever = UserModel(
//   id: 7,
//   name: 'Vin Hock',
//   imageUrl: 'assets/images/p8.jpeg',
//   isOnline: false,
// );
