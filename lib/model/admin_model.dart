// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  AdminModel({this.email, this.imgUrl, this.phoneNo, this.uid, this.adminName});

  String? email;
  String? imgUrl;
  String? phoneNo;
  String? uid;
  String? adminName;

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        email: json["email"] == null ? null : json["email"],
        imgUrl: json["imgUrl"] == null ? null : json["imgUrl"],
        phoneNo: json["phoneNo"] == null ? null : json["phoneNo"],
        uid: json["uid"] == null ? null : json["uid"],
        adminName: json["adminName"] == null ? null : json["adminName"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "imgUrl": imgUrl == null ? null : imgUrl,
        "phoneNo": phoneNo == null ? null : phoneNo,
        "uid": uid == null ? null : uid,
        "adminName": adminName == null ? null : adminName,
      };
}
