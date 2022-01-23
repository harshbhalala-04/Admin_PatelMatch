// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.uid,
    this.username,
    this.age,
    this.height,
    this.weight,
    this.handicapped,
    this.gender,
    this.education,
    this.worklife,
    this.maritalStatus,
    this.salary,
    this.profileCreatedBy,
    this.drink,
    this.smoke,
    this.zodiacSign,
    this.politics,
    this.movie,
    this.imgCount,
    this.notificationTokens,
    this.imgUrl,
    this.imgUrls,
    this.bookayAvailable,
    this.friendRequest,
    this.excludedUsers,
    this.samaj,
    this.userNRI,
    this.star,
    this.rashi,
    this.manglik,
    this.createdAt,
    this.gotra,
    this.siblings,
    this.fatherName,
    this.fatherNativePlace,
    this.fatherAvgAnnualIncome,
    this.fatherOccupation,
    this.motherName,
    this.motherNativePlace,
    this.motherOccupation,
    this.motherAvgAnnualIncome,
    this.totalBrothers,
    this.totalSisters,
    this.marriedBrothers,
    this.marriedSisters,
    this.currentCity,
    this.email,
    this.phoneNo,
    this.nativeCity,
    this.birthDate,
  });

  String? uid;
  String? username;
  String? age;
  String? height;
  String? weight;
  String? gender;
  String? education;
  String? worklife;
  String? maritalStatus;
  String? salary;
  String? profileCreatedBy;
  String? drink;
  String? smoke;
  String? zodiacSign;
  String? politics;
  String? movie;
  int? imgCount;
  List<String>? notificationTokens;
  String? imgUrl;
  List<String>? imgUrls;
  int? bookayAvailable;
  Timestamp? createdAt;
  List<dynamic>? friendRequest;
  List<dynamic>? excludedUsers;
  String? samaj;
  String? handicapped;
  String? userNRI;
  String? star;
  String? rashi;
  String? manglik;
  String? gotra;
  bool? siblings;
  String? fatherName;
  String? fatherNativePlace;
  String? fatherOccupation;
  String? fatherAvgAnnualIncome;
  String? motherName;
  String? motherNativePlace;
  String? motherOccupation;
  String? motherAvgAnnualIncome;
  String? totalBrothers;
  String? totalSisters;
  String? marriedBrothers;
  String? marriedSisters;
  String? currentCity;
  String? email;
  String? phoneNo;
  String? nativeCity;
  String? birthDate;
  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
        uid: json["uid"] == null ? null : json["uid"],
        username: json["username"] == null ? null : json["username"],
        nativeCity: json["nativeCity"] == null ? null : json["nativeCity"],
        birthDate: json["birthDate"] == null ? null : json["birthDate"],
        age: json["age"] == null ? null : json["age"],
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        gender: json["gender"] == null ? null : json["gender"],
        education: json["education"] == null ? null : json["education"],
        worklife: json["worklife"] == null ? null : json["worklife"],
        handicapped: json["handicapped"] == null ? null : json["handicapped"],
        email: json["email"] == null ? null : json["email"],
        phoneNo: json["phoneNo"] == null ? null : json["phoneNo"],
        salary: json["salary"] == null ? null : json["salary"],
        star: json["star"] == null ? null : json["star"],
        rashi: json["rashi"] == null ? null : json["rashi"],
        userNRI: json["userNRI"] == null ? null : json["userNRI"],
        currentCity: json["currentCity"] == null ? null : json["currentCity"],
        profileCreatedBy:
            json["profileCreatedBy"] == null ? null : json["profileCreatedBy"],
        maritalStatus:
            json["maritalStatus"] == null ? null : json["maritalStatus"],
        manglik: json["manglik"] == null ? null : json["manglik"],
        gotra: json["gotra"] == null ? null : json["gotra"],
        siblings: json["siblings"] == null ? null : json["siblings"],
        fatherName: json["fatherName"] == null ? null : json["fatherName"],
        totalBrothers:
            json["totalBrothers"] == null ? null : json["totalBrothers"],
        totalSisters:
            json["totalSisters"] == null ? null : json["totalSisters"],
        marriedBrothers:
            json["marriedBrothers"] == null ? null : json["marriedBrothers"],
        marriedSisters:
            json["marriedSisters"] == null ? null : json["marriedSisters"],
        fatherNativePlace:
            json["fatherNative"] == null ? null : json["fatherNative"],
        fatherAvgAnnualIncome: json["fatherAvgAnnualIncome"] == null
            ? null
            : json["fatherAvgAnnualIncome"],
        fatherOccupation:
            json["fatherOccupation"] == null ? null : json["fatherOccupation"],
        motherName: json["motherName"] == null ? null : json["motherName"],
        motherAvgAnnualIncome: json["motherAvgAnnualIncome"] == null
            ? null
            : json["motherAvgAnnualIncome"],
        motherNativePlace:
            json["motherNative"] == null ? null : json["motherNative"],
        motherOccupation:
            json["motherOccupation"] == null ? null : json["motherOccupation"],
        drink: json["drink"] == null ? null : json["drink"],
        smoke: json["smoke"] == null ? null : json["smoke"],
        zodiacSign: json["zodiacSign"] == null ? null : json["zodiacSign"],
        politics: json["politics"] == null ? null : json["politics"],
        movie: json["movie"] == null ? null : json["movie"],
        samaj: json["userSamaj"] == null ? null : json["userSamaj"],
        imgCount: json["imgCount"] == null ? null : json["imgCount"],
        notificationTokens: json["notificationTokens"] == null
            ? null
            : List<String>.from(json["notificationTokens"].map((x) => x)),
        imgUrl: json["imgUrl"] == null ? null : json["imgUrl"],
        imgUrls: json["imgUrls"] == null
            ? null
            : List<String>.from(json["imgUrls"].map((x) => x)),
        bookayAvailable:
            json["bookayAvailable"] == null ? null : json["bookayAvailable"],
        friendRequest: json["friendRequest"].length == 0
            ? null
            : List<dynamic>.from(json["friendRequest"].map((x) => x)),
        excludedUsers: json["excludedUsers"].length == 0
            ? []
            : List<dynamic>.from(json["excludedUsers"].map((x) => x)));
  }

  Map<dynamic, dynamic> toJson() => {
        "uid": uid == null ? null : uid,
        "username": username == null ? null : username,
        "age": age == null ? null : age,
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
        "gender": gender == null ? null : gender,
        "createdAt": createdAt == null ? null : createdAt,
        "handicapped": handicapped == null ? null : handicapped,
        "education": education == null ? null : education,
        "worklife": worklife == null ? null : worklife,
        "maritalStatus": maritalStatus == null ? null : maritalStatus,
        "userNRI": userNRI == null ? null : userNRI,
        "salary": salary == null ? null : salary,
        "userSamaj": samaj == null ? null : samaj,
        "star": star == null ? null : star,
        "rashi": rashi == null ? null : rashi,
        "manglik": manglik == null ? null : manglik,
        "gotra": gotra == null ? null : gotra,
        "siblings": siblings == null ? null : siblings,
        "fatherName": fatherName == null ? null : fatherName,
        "fatherNativePlace":
            fatherNativePlace == null ? null : fatherNativePlace,
        "fatherAvgAnnualIncome":
            fatherAvgAnnualIncome == null ? null : fatherAvgAnnualIncome,
        "fatherOccupation": fatherOccupation == null ? null : fatherOccupation,
        "motherName": motherName == null ? null : motherName,
        "motherAvgAnnualIncome":
            motherAvgAnnualIncome == null ? null : motherAvgAnnualIncome,
        "motherNativePlace":
            motherNativePlace == null ? null : motherNativePlace,
        "motherOccupation": motherOccupation == null ? null : motherOccupation,
        "profileCreatedBy": profileCreatedBy == null ? null : profileCreatedBy,
        "drink": drink == null ? null : drink,
        "smoke": smoke == null ? null : smoke,
        "zodiacSign": zodiacSign == null ? null : zodiacSign,
        "politics": politics == null ? null : politics,
        "movie": movie == null ? null : movie,
        "imgCount": imgCount == null ? null : imgCount,
        "notificationTokens": notificationTokens == null
            ? null
            : List<dynamic>.from(notificationTokens!.map((x) => x)),
        "imgUrl": imgUrl == null ? null : imgUrl,
        "imgUrls":
            imgUrls == null ? null : List<dynamic>.from(imgUrls!.map((x) => x)),
        "bookayAvailable": bookayAvailable == null ? null : bookayAvailable,
        "friendRequest": friendRequest == null
            ? null
            : List<dynamic>.from(friendRequest!.map((x) => x)),
        "excludedUsers": excludedUsers == null
            ? null
            : List<dynamic>.from(excludedUsers!.map((x) => x)),
      };
}
