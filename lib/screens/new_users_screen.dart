// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_patelmatch/controllers/screen_controller.dart';
import 'package:admin_patelmatch/model/user_model.dart';
import 'package:admin_patelmatch/screens/single_user_detail.dart';
import 'package:admin_patelmatch/screens/user_details_screen.dart';
import 'package:admin_patelmatch/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewUserScreen extends StatefulWidget {
  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontFamily: 'Cabin',
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                  onChanged: (val) {
                    searchUser(val);
                  },
                ),
              ),
            ),
            Obx(() => Get.find<ScreenController>().isLoading.value
                ? Center(child: CircularProgressIndicator())
                :  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          Get.find<ScreenController>().foundNewUsers.length,
                      itemBuilder: (ctx, index) {
                        String userEmail = Get.find<ScreenController>()
                            .foundNewUsers[index]
                            .email!;
                        String userName = Get.find<ScreenController>()
                            .foundNewUsers[index]
                            .username!;
                        String userPhone = Get.find<ScreenController>()
                            .foundNewUsers[index]
                            .phoneNo!;

                        String subTitleStr = userEmail + " | " + userPhone;
                        return InkWell(
                          onTap: () {
                            Get.to(UserDetailsScreen(
                              user: Get.find<ScreenController>()
                                  .foundNewUsers[index],
                              index: index,
                              isVisible: true,
                            ));
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Card(
                                elevation: 2.5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(
                                        Get.find<ScreenController>()
                                            .foundNewUsers[index]
                                            .imgUrl!),
                                  ),
                                  title: Text(userName,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(51, 51, 51, 1),
                                      )),
                                  subtitle: Text(
                                    subTitleStr,
                                    style: TextStyle(
                                      color: Color.fromRGBO(51, 51, 51, 1),
                                      fontSize: 12,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_right_rounded,
                                    color: Color.fromRGBO(255, 85, 115, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
          ],
        ),
      ),
    );
  }

  void searchUser(String query) {
    if (query.isEmpty) {
      Get.find<ScreenController>().foundNewUsers =
          Get.find<ScreenController>().newUsers;
    }
    final listUsers = Get.find<ScreenController>().newUsers.where((users) {
      final userNameLower = users.username!.toLowerCase();
      final emailLower = users.email!.toLowerCase();
      final searchLower = query.toLowerCase();

      return userNameLower.contains(searchLower) ||
          emailLower.contains(searchLower);
    }).toList();

    setState(() {
      Get.find<ScreenController>().foundNewUsers = listUsers;
    });
  }
}
