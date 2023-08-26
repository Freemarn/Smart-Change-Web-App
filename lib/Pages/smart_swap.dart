// import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_change/models/swappers_model.dart';

import '../models/chat_model.dart';
import '../models/user_model.dart';
import '../providers/chats.dart';
import '../utilis/app_colors.dart';

class SmartSwapPage extends StatefulWidget {
  const SmartSwapPage({super.key});

  @override
  State<SmartSwapPage> createState() => _SmartSwapPageState();
}

class _SmartSwapPageState extends State<SmartSwapPage> {
  List<Swap> swapTransact = allSwappers;
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 650,
        width: 400,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            children: [
              Text(
                'Smart Swap',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 35,
                    width: 300,
                    child: TextFormField(
                      onChanged: (value) {
                        search = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'search messages here...',
                          hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.blueGrey.shade900.withOpacity(0.2)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 11, 44, 12),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Center(
                        child: Icon(
                          Icons.search,
                          size: 15,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                
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
                    'Merchant List',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey.shade700,
                        fontWeight: FontWeight.w800),
                  ),
                 
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("_users")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text("Something went wrong"));
                    }
                    
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: Text("Loading..."));
                    }
                    
                    if (!snapshot.hasData) {
                      // Collection is empty
                      return const Center(child: Text("Empty"));
                    }

                    List<DocumentSnapshot> userDocuments =snapshot.data!.docs.where((element) => UserModel.fromMap(element.data() as Map<String, dynamic>).username.contains(search)).toList();;
                    // if(search.isNotEmpty){
                    //   userDocuments = snapshot.data!.docs.where((element) => UserModel.fromMap(element.data() as Map<String, dynamic>).username.contains(search)).toList();
                    // } else{
                    //   userDocuments = snapshot.data!.docs;
                    // }

                    return ListView.builder(
                      itemCount: userDocuments.length,
                      itemBuilder: (context, index) {
                        final doc = userDocuments[index];
                        final user = UserModel.fromMap(
                            doc.data() as Map<String, dynamic>);

                        return SmartWrapCard(user: user);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchSwap(String query) {
    final suggestion = allSwappers.where((swap) {
      var swapTitle = swap.name.toLowerCase();
      final input = query.toLowerCase();

      return swapTitle.contains(input);
    }).toList();

    setState(() {
      swapTransact = suggestion;
    });
  }
}

class SmartWrapCard extends StatelessWidget {
  const SmartWrapCard({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 145,
          width: 360,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(user.photoUrl),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 5,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            String uid = FirebaseAuth.instance.currentUser!.uid;
                            // TODO:
                            final chat = ChatCollectionModel(
                              chatRoomId: uid + user.uid,
                              displayName: user.username,
                              username: "John",
                              displayPictureURL: user.photoUrl,
                              recentMesg: '',
                              peerId: user.uid,
                              userId: uid,
                              recentMesgTime: DateTime.now(),
                              isOnline: false,
                            );

                            // Create the chat collection
                            await context
                                .read<ChatProvider>()
                                .createChat(context, chat);
                          },
                          child: Text(
                            user.username,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey.shade700,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.verified_rounded,
                            size: 17, color: Colors.blueGrey.shade700),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.ClickableBottonColor,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 2,
                          height: 15,
                          color: AppColors.FooterImageBorderColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '+4.5',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueGrey[700],
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selling @',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueGrey.shade500.withOpacity(0.6),
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          user.sellingPrice,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.blueGrey[700]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'Accepts : ',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.blueGrey.shade600
                                      .withOpacity(0.6)),
                            ),
                            Text(
                              'BTC',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 2,
                              height: 10,
                              color: AppColors.FooterImageBorderColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'ETH',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 2,
                              height: 10,
                              color: AppColors.FooterImageBorderColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'BNB',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 2,
                              height: 10,
                              color: AppColors.FooterImageBorderColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'USDT',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.blueGrey[500],
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 3,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Rating: +134',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueGrey.shade700
                                      .withOpacity(0.6)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 3,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Trades: ${user.trades}',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueGrey.shade700
                                      .withOpacity(0.6)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 3,
                              color: Colors.green.shade300,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Complete: ${user.complete}%',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueGrey.shade700
                                      .withOpacity(0.6)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 3,
                              color: Colors.red.shade300,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Duration: ${user.duration} mins',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueGrey.shade700
                                      .withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    ); //isSameUser;
  }
}
