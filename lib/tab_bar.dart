// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_patelmatch/controllers/image_picker_controller.dart';
import 'package:admin_patelmatch/global.dart';
import 'package:admin_patelmatch/screens/approved_users_screen.dart';
import 'package:admin_patelmatch/controllers/screen_controller.dart';
import 'package:admin_patelmatch/screens/navigation_screen.dart';
import 'package:admin_patelmatch/screens/new_users_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  TabBarScreenState createState() => TabBarScreenState();
}

class TabBarScreenState extends State<TabBarScreen> {
  final screenController = Get.put(ScreenController());

  PageController? pageController;

  void initState() {
    pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(screenController.currentAdmin.value.adminName);
    print(screenController.currentAdmin.value.email);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
              margin: EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.all(4),
                          child: InkWell(
                            onTap: () {
                              Get.to(NavigationScreen());
                            },
                            child: Obx(() => isSignup
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    backgroundImage: FileImage(
                                        Get.find<ImagePickerController>()
                                            .choosenImage
                                            .value),
                                  )
                                : Get.find<ScreenController>().isLoading.value
                                    ? CircleAvatar(
                                        backgroundColor: Colors.grey,
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        backgroundImage: NetworkImage(
                                            Get.find<ScreenController>()
                                                .currentAdmin
                                                .value
                                                .imgUrl!),
                                      )),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => TabButton(
                              text: "  New  ",
                              // pending: false,
                              pageNumber: 0,
                              selectedPage: screenController.selectedPage.value,
                              onPressed: () {
                                pageController!.animateToPage(0,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                            ),
                          ),
                          Obx(
                            () => TabButton(
                              text: "     Approved     ",
                              pageNumber: 1,
                              selectedPage: screenController.selectedPage.value,
                              onPressed: () {
                                pageController!.animateToPage(1,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ))),
      body: PageView(
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: (int page) {
          screenController.selectedPage.value = page;
        },
        controller: pageController,
        children: [
          NewUserScreen(),
          ApprovedUsersScreen(),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String? text;
  final int? selectedPage;
  final int? pageNumber;
  // final bool? pending;
  final onPressed;
  TabButton(
      {this.text,
      // this.pending,
      this.selectedPage,
      this.pageNumber,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: selectedPage == pageNumber
              ? Color.fromRGBO(255, 85, 115, 1)
              : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: text == "  New  "
                  ? BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50))
                  : BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
        ),
        child: Row(
          children: [
            Text(
              text!,
              style: TextStyle(
                  fontFamily: "Cabin",
                  color: selectedPage == pageNumber
                      ? Colors.white
                      : Color.fromRGBO(150, 150, 150, 1)),
            ),
          ],
        ));
  }
}
