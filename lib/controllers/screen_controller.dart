import 'package:admin_patelmatch/model/admin_model.dart';
import 'package:admin_patelmatch/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ScreenController extends GetxController {
  final selectedPage = 0.obs;
  final isLoading = false.obs;
  List<UserModel> newUsers = <UserModel>[].obs;
  List<UserModel> approvedUsers = <UserModel>[].obs;
  List<UserModel> rejectedUsers = <UserModel>[].obs;
  final User? user = FirebaseAuth.instance.currentUser;
  Rx<AdminModel> currentAdmin = AdminModel().obs;
  final AutoScrollController scrollController = AutoScrollController();

  List<UserModel> foundNewUsers = <UserModel>[].obs;
  List<UserModel> foundApprovedUsers = <UserModel>[].obs;
  List<UserModel> foundRejectedUsers = <UserModel>[].obs;

  void changePage(int pageNum) {
    selectedPage.value = pageNum;
  }

  void removeUserFromNew(String uid) {
    newUsers.removeWhere((element) => element.uid == uid);
  }

  void addUserToApprove(String uid) {
    int index = newUsers.indexWhere((element) => element.uid == uid);
    UserModel newApprovedUser = newUsers[index];
    approvedUsers.add(newApprovedUser);

    approvedUsers.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
  }

  void addUserToReject(String uid) {
    int index = newUsers.indexWhere((element) => element.uid == uid);

    UserModel newRejectedUser = newUsers[index];
    rejectedUsers.add(newRejectedUser);

    rejectedUsers.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
  }

  void fetchUsers() async {
    isLoading.toggle();

    await FirebaseFirestore.instance
        .collection("admin")
        .doc(user!.uid)
        .get()
        .then((val) {
      currentAdmin.value = AdminModel.fromJson(val.data()!);
      print(currentAdmin.value.email);
      print(currentAdmin.value.imgUrl);
      print(currentAdmin.value.phoneNo);
      print(currentAdmin.value.uid);
    });
    await FirebaseFirestore.instance
        .collection("users")
        .where("isApproved", isEqualTo: false)
        .where("isRejected", isEqualTo: false)
        .orderBy("createdAt", descending: true)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          newUsers.add(UserModel.fromJson(element.data()));
        });
      }
    });

    await FirebaseFirestore.instance
        .collection("users")
        .where("isApproved", isEqualTo: true)
        .orderBy("createdAt", descending: true)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          approvedUsers.add(UserModel.fromJson(element.data()));
        });
      }
    });

    await FirebaseFirestore.instance
        .collection("users")
        .where("isRejected", isEqualTo: true)
        .orderBy("createdAt", descending: true)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          rejectedUsers.add(UserModel.fromJson(element.data()));
        });
      }
    });
    foundNewUsers = newUsers;
    foundApprovedUsers = approvedUsers;
    foundRejectedUsers = rejectedUsers;
    isLoading.toggle();
    for (int i = 0; i < newUsers.length; i++) {
      print(newUsers[i].username);
    }

    for (int i = 0; i < approvedUsers.length; i++) {
      print(approvedUsers[i].username);
    }

    for (int i = 0; i < rejectedUsers.length; i++) {
      print(rejectedUsers[i].username);
    }
  }

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }
}
