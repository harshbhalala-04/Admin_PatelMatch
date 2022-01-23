// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_patelmatch/controllers/screen_controller.dart';
import 'package:admin_patelmatch/database/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class FeedButton extends StatelessWidget {
  int index;
  final String otherUsername;
  final String otherImageUrl;
  final String otherUserId;

  FeedButton({
    required this.index,
    required this.otherUsername,
    required this.otherImageUrl,
    required this.otherUserId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 15,
            ),
            Container(
              width: 130,
              height: 45,
              child: FloatingActionButton(
                heroTag: 'DeclineButton1',
                onPressed: () {
                  Get.find<ScreenController>().addUserToReject(otherUserId);
                  Get.find<ScreenController>().removeUserFromNew(otherUserId);
                 
                  Get.back();
                  DataBaseMethods().rejectUser(otherUserId);
                },
                child: Text(
                  'Reject',
                  style: TextStyle(
                      fontFamily: "Cabin",
                      fontSize: 18,
                      color: Color.fromRGBO(184, 184, 184, 1)),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 130,
              height: 45,
              child: FloatingActionButton(
                heroTag: 'ConnectButton1',
                onPressed: () {
                  Get.find<ScreenController>().addUserToApprove(otherUserId);
                  Get.find<ScreenController>().removeUserFromNew(otherUserId);
                  
                  Get.back();
                  DataBaseMethods().approveUser(otherUserId);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(255, 71, 104, 1),
                        Color.fromRGBO(255, 115, 140, 1)
                      ]),
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    width: 130,
                    height: 45,
                    alignment: Alignment.center,
                    child: Text(
                      'Approve',
                      style: TextStyle(
                        fontFamily: "Cabin",
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
