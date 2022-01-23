// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ImagePickerController extends GetxController {
  final tempImage = [
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
  ].obs;
  final count = 0.obs;
  final isLoading = false.obs;
  String? imgUrl = '';
  File? _pickedImageVar;
  final newIndex = 0.obs;
  final choosenImage = File("").obs;
  final isUploadedImage = false.obs;
  // List<dynamic> image = [
  //   "assets/add_img2.png",
  //   "assets/add_img2.png",
  //   "assets/add_img2.png",
  //   "assets/add_img2.png",
  //   "assets/add_img2.png",
  //   "assets/add_img2.png",
  // ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void showCustomDialog() {
    Get.defaultDialog(
      middleText: "Plese Select Your Image",
      title: "",
      middleTextStyle: TextStyle(fontSize: 20),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Close'),
                style:
                    TextButton.styleFrom(textStyle: TextStyle(fontSize: 16))),
          ],
        )
      ],
      barrierDismissible: false,
    );
  }

  /// Crop Image
  Future cropImage(File pickedImage) async {
    try {
      File? croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedImage.path,
          aspectRatioPresets: Platform.isAndroid
              ? [
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio16x9
                ]
              : [
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio5x3,
                  CropAspectRatioPreset.ratio5x4,
                  CropAspectRatioPreset.ratio7x5,
                  CropAspectRatioPreset.ratio16x9
                ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              lockAspectRatio: false),
          compressQuality: 50,
          iosUiSettings: IOSUiSettings(
            title: 'Crop Image',
          ));
      if (croppedFile != null) {
        pickedImage = croppedFile;
      }
      return pickedImage;
    } catch (e) {
      print(e);
    }
  }

  void pickImage(
    BuildContext context,
  ) async {
    print('This is picked image controller : ${isLoading.value}');
    ImageSource? imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Upload Your Image'),
        actions: [
          MaterialButton(
            child: Text('Camera'),
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            textColor: Theme.of(context).primaryColor,
          ),
          MaterialButton(
            child: Text('Gallery'),
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            textColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );

    if (imageSource != null) {
      isLoading.toggle();

      final _picker = ImagePicker();

      final PickedFile? pickedImageFile = await _picker.getImage(
        source: imageSource,
        imageQuality: 50,
        maxWidth: 1400,
        maxHeight: 1400,
      );

      if (pickedImageFile == null) {
        isLoading.toggle();
      } else {
        File file = File(pickedImageFile.path);
        print(file);
        // file = await cropImage(file);
        choosenImage.value = file;
        isUploadedImage.value = true;
        isLoading.toggle();
        //tempImage.add(url);
      }
    }
  }
}
