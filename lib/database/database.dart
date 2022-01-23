import 'dart:io';

import 'package:admin_patelmatch/controllers/screen_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class DataBaseMethods {
  final FirebaseAuth? auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final firestore = FirebaseFirestore.instance;

  uploadUserImages(File userImages) async {
    List<String> urlList = [];
    File file = File('');

    if (userImages.path != '') {
      final ref = FirebaseStorage.instance
          .ref()
          .child('admin_images')
          .child(user!.uid + '.jpg');

      await ref.putFile(userImages).whenComplete(() => print('Image Upload'));

      String url = await ref.getDownloadURL();
      Get.find<ScreenController>().currentAdmin.value.imgUrl = url;
      print(
          "Url uploaded: ${Get.find<ScreenController>().currentAdmin.value.imgUrl}");
      urlList.add(url);

      await firestore
          .collection("admin")
          .doc(user!.uid)
          .update({"imgUrl": url});
    }
  }

  rejectUser(String otherUid) async {
    await firestore
        .collection("users")
        .doc(otherUid)
        .update({"isRejected": true});
  }

  approveUser(String otherUid) async {
    await firestore
        .collection("users")
        .doc(otherUid)
        .update({"isApproved": true, "approvedBy": user!.email});


  }
}
