// ignore_for_file: prefer_const_constructors

import 'package:admin_patelmatch/model/user_model.dart';
import 'package:admin_patelmatch/screens/single_user_detail.dart';
import 'package:admin_patelmatch/widgets/feed_button.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  final UserModel user;
  final int index;
  final bool isVisible;

  UserDetailsScreen({
    required this.user,
    required this.index,
    required this.isVisible,
  });

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Profile',
          style:
              TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Cabin"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Positioned(
            child: SingleUserDetail(
              currentUser: widget.user,
              index: 0,
              userImagesLength: widget.user.imgUrls!.length,
            ),
          ),
          widget.isVisible
              ? Positioned(
                  top: MediaQuery.of(context).size.height - 250,
                  left: 0,
                  right: MediaQuery.of(context).size.width - 350,
                  child: FeedButton(
                    index: 0,
                    otherImageUrl: widget.user.imgUrl!,
                    otherUserId: widget.user.uid!,
                    otherUsername: widget.user.username!,
                  ))
              : Container(),
        ],
      ),
    );
  }
}
