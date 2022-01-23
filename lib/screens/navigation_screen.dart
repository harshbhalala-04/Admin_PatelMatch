// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_patelmatch/controllers/screen_controller.dart';
import 'package:admin_patelmatch/screens/auth_screen.dart';
import 'package:admin_patelmatch/screens/rejected_users_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Profile",
            style: TextStyle(
                fontFamily: "Cabin", fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(Get.find<ScreenController>().currentAdmin.value.imgUrl!),
                  radius: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  Get.find<ScreenController>().currentAdmin.value.adminName!,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(RejectedUsersScreen());
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.person_pin_sharp,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Rejected Users',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(51, 51, 51, 1),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Get.off(AuthScreen());
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(51, 51, 51, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ])));
  }
}
