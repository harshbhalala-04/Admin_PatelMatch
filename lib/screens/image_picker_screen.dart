// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:admin_patelmatch/controllers/image_picker_controller.dart';
import 'package:admin_patelmatch/database/database.dart';
import 'package:admin_patelmatch/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    //print('This is isLoading value: ${controller.isLoading.value}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'PM',
          style:
              TextStyle(color: Color.fromRGBO(255, 85, 115, 1), fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              'Upload Your Photo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 5,
            ),
           
            SizedBox(
              height: 5,
            ),
           
            SizedBox(
              height: 10,
            ),
            Obx(() => (imagePickerController.isLoading.value)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InkWell(
                    onTap: () {
                      imagePickerController.pickImage(context);
                    },
                    child: imagePickerController.isUploadedImage.value
                        ? Container(
                            child: Image(
                              width: 150,
                              height: 150,
                              image: FileImage(
                                  imagePickerController.choosenImage.value),
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            child: Image(
                              width: 150,
                              height: 150,
                              image: AssetImage("assets/add_img2.png"),
                              fit: BoxFit.cover,
                            ),
                          ))),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: ElevatedButton(
              onPressed: () {
                if (imagePickerController.tempImage.length < 1) {
                  imagePickerController.showCustomDialog();
                } else {
                  
                  DataBaseMethods().uploadUserImages(
                    imagePickerController.choosenImage.value,
                  );
                  Get.off(TabBarScreen());
                }
              },
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 17),
              ),
              style: ButtonStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
