// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'package:admin_patelmatch/controllers/screen_controller.dart';
import 'package:admin_patelmatch/model/user_model.dart';
import 'package:admin_patelmatch/widgets/info_title.dart';
import 'package:admin_patelmatch/widgets/user_info_card.dart';
import 'package:admin_patelmatch/widgets/user_image_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SingleUserDetail extends StatelessWidget {
  final UserModel currentUser;
  final int userImagesLength;
  final int index;
  bool reqRecieve;
  SingleUserDetail(
      {required this.currentUser,
      required this.userImagesLength,
      required this.index,
      this.reqRecieve = false});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    String siblingMarriedString = '';
    String siblingTotalString = '';
    if (currentUser.marriedBrothers != null &&
        currentUser.marriedBrothers != "") {
      if (int.parse(currentUser.marriedBrothers!) > 0) {
        if (int.parse(currentUser.marriedBrothers!) == 1) {
          siblingMarriedString = siblingMarriedString +
              currentUser.marriedBrothers! +
              ' brother, ';
        } else {
          siblingMarriedString = siblingMarriedString +
              currentUser.marriedBrothers! +
              ' brothers, ';
        }
      }
    }
    if (currentUser.marriedSisters != null &&
        currentUser.marriedSisters != "") {
      if (int.parse(currentUser.marriedSisters!) > 0) {
        if (int.parse(currentUser.marriedSisters!) == 1) {
          siblingMarriedString =
              siblingMarriedString + currentUser.marriedSisters! + ' sister';
        } else {
          siblingMarriedString =
              siblingMarriedString + currentUser.marriedSisters! + ' sisters';
        }
      }
    }
    if (currentUser.totalBrothers != null && currentUser.totalBrothers != "") {
      if (int.parse(currentUser.totalBrothers!) > 0) {
        if (int.parse(currentUser.totalBrothers!) == 1) {
          siblingTotalString =
              siblingTotalString + currentUser.totalBrothers! + ' brother, ';
        } else {
          siblingTotalString =
              siblingTotalString + currentUser.totalBrothers! + ' brothers, ';
        }
      }
    }
    if (currentUser.totalSisters != null && currentUser.totalSisters != "") {
      if (int.parse(currentUser.totalSisters!) > 0) {
        if (int.parse(currentUser.totalSisters!) == 1) {
          siblingTotalString =
              siblingTotalString + currentUser.totalSisters! + ' sister';
        } else {
          siblingTotalString =
              siblingTotalString + currentUser.totalSisters! + ' sisters';
        }
      }
    }

    return AutoScrollTag(
      key: ValueKey(index),
      controller: Get.find<ScreenController>().scrollController,
      index: index,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  height: screenSize.height,
                  width: screenSize.width,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                  imageUrl: currentUser.imgUrl ?? '',
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 23.0,
                    top: 12,
                    bottom: 12,
                  ),
                  child: Text(
                    '${currentUser.username}, ${currentUser.age}',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(51, 51, 51, 1)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'Profile Created By: ',
                        style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 20,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            primary: Colors.white,
                          ),
                          onPressed: () {},
                          child: Text(
                            currentUser.profileCreatedBy!,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(255, 85, 115, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23, bottom: 10),
                  child: Text(
                    'Personal Information',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromRGBO(51, 51, 51, 1)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      UserInfoCard(title: 'Samaj', subTitle: currentUser.samaj),
                      currentUser.samaj != null && currentUser.samaj != ''
                          ? SizedBox(width: 20)
                          : SizedBox(
                              width: 0,
                            ),
                      UserInfoCard(
                          title: 'Gender', subTitle: currentUser.gender)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      UserInfoCard(
                          title: 'Date Of Birth',
                          subTitle: currentUser.birthDate),
                      currentUser.birthDate != null
                          ? SizedBox(width: 20)
                          : SizedBox(
                              width: 0,
                            ),
                      UserInfoCard(
                          title: 'Weight', subTitle: currentUser.weight),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      UserInfoCard(
                          title: 'Height', subTitle: currentUser.height),
                      currentUser.height != null && currentUser.height != ''
                          ? SizedBox(width: 20)
                          : SizedBox(
                              width: 0,
                            ),
                      UserInfoCard(
                          title: 'Handicapped',
                          subTitle: currentUser.handicapped)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      UserInfoCard(
                          title: 'Marital Status',
                          subTitle: currentUser.maritalStatus),
                      currentUser.maritalStatus != null &&
                              currentUser.maritalStatus != ''
                          ? SizedBox(width: 20)
                          : SizedBox(
                              width: 0,
                            ),
                      currentUser.maritalStatus == null ||
                              currentUser.maritalStatus == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'NRI Status',
                              subTitle: currentUser.userNRI)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      UserInfoCard(
                          title: 'Current City Of Residence',
                          subTitle: currentUser.currentCity),
                      currentUser.currentCity != null &&
                              currentUser.currentCity != ''
                          ? SizedBox(width: 20)
                          : SizedBox(
                              width: 0,
                            ),
                      currentUser.nativeCity == null ||
                              currentUser.nativeCity == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'Native Place',
                              subTitle: currentUser.nativeCity),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      currentUser.star == null || currentUser.star == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'Star Sign', subTitle: currentUser.star),
                      currentUser.star != null && currentUser.star != ''
                          ? SizedBox(width: 20)
                          : SizedBox(
                              width: 0,
                            ),
                      currentUser.rashi == null || currentUser.rashi == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'Rashi', subTitle: currentUser.rashi),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      currentUser.manglik == null || currentUser.manglik == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'Manglik', subTitle: currentUser.manglik),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                userImagesLength < 2
                    ? Container(
                        height: 0,
                      )
                    : UserImageCard(image: currentUser.imgUrls![1]),
                (currentUser.education != null &&
                            currentUser.education != '') ||
                        (currentUser.worklife != '' &&
                            currentUser.worklife != null) ||
                        (currentUser.salary != '' && currentUser.salary != null)
                    ? InfoTitle(title: 'Professional Information')
                    : Container(
                        height: 0,
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      currentUser.education == null ||
                              currentUser.education == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'Highest Education',
                              subTitle: currentUser.education),
                      currentUser.education != null &&
                              currentUser.education != ''
                          ? SizedBox(width: 20)
                          : SizedBox(
                              width: 0,
                            ),
                      currentUser.worklife == null || currentUser.worklife == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'Employment Status',
                              subTitle: currentUser.worklife),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      currentUser.salary == null || currentUser.salary == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'Annual Income',
                              subTitle: currentUser.salary),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                userImagesLength < 3
                    ? Container(
                        height: 0,
                      )
                    : UserImageCard(image: currentUser.imgUrls![2]),
                (currentUser.drink != null && currentUser.drink != '') ||
                        (currentUser.smoke != null && currentUser.smoke != '')
                    ? InfoTitle(title: 'Social Life')
                    : Container(
                        height: 0,
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      currentUser.drink == null || currentUser.drink == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'Drink', subTitle: currentUser.drink),
                      currentUser.drink != null && currentUser.drink != ''
                          ? SizedBox(width: 20)
                          : SizedBox(
                              width: 0,
                            ),
                      currentUser.smoke == null || currentUser.smoke == ''
                          ? Container()
                          : UserInfoCard(
                              title: 'Smoke', subTitle: currentUser.smoke)
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                userImagesLength < 4
                    ? Container(
                        height: 0,
                      )
                    : UserImageCard(image: currentUser.imgUrls![3]),
                (siblingMarriedString != '' || siblingTotalString != '') ||
                        (currentUser.fatherName != null ||
                            currentUser.fatherAvgAnnualIncome != null ||
                            currentUser.fatherNativePlace != null ||
                            currentUser.fatherOccupation != null) ||
                        (currentUser.motherName != null ||
                            currentUser.motherAvgAnnualIncome != null ||
                            currentUser.motherNativePlace != null ||
                            currentUser.motherOccupation != null)
                    ? InfoTitle(title: 'Family')
                    : Container(),
                siblingMarriedString == '' && siblingTotalString == ''
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          width: 300,
                          child: Card(
                            elevation: 2.5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Siblings',
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 85, 115, 1),
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  siblingMarriedString == ''
                                      ? Container()
                                      : RichText(
                                          text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: 'Married: ',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        128, 128, 128, 1),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16)),
                                            TextSpan(
                                              text: siblingMarriedString,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      51, 51, 51, 1),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        )),
                                  siblingTotalString == ''
                                      ? Container()
                                      : RichText(
                                          text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: 'Total: ',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        128, 128, 128, 1),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16)),
                                            TextSpan(
                                              text: siblingTotalString,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      51, 51, 51, 1),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                (currentUser.fatherName == null ||
                        currentUser.fatherAvgAnnualIncome == null ||
                        currentUser.fatherNativePlace == null ||
                        currentUser.fatherOccupation == null)
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          width: 300,
                          child: Card(
                            elevation: 2.5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Paternal',
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 85, 115, 1),
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Name: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                      TextSpan(
                                        text: currentUser.fatherName == null
                                            ? ''
                                            : currentUser.fatherName,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )),
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Native Place: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                      TextSpan(
                                        text: currentUser.fatherNativePlace ==
                                                null
                                            ? ''
                                            : currentUser.fatherNativePlace,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )),
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Occupation: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                      TextSpan(
                                        text:
                                            currentUser.fatherOccupation == null
                                                ? ''
                                                : currentUser.fatherOccupation,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )),
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Average Annual Income: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                      TextSpan(
                                        text: currentUser
                                                    .fatherAvgAnnualIncome ==
                                                null
                                            ? ''
                                            : currentUser.fatherAvgAnnualIncome,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                (currentUser.motherName == null ||
                        currentUser.motherAvgAnnualIncome == null ||
                        currentUser.motherNativePlace == null ||
                        currentUser.motherOccupation == null)
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          width: 300,
                          child: Card(
                            elevation: 2.5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Maternal',
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 85, 115, 1),
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Name: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                      TextSpan(
                                        text: currentUser.motherName == null
                                            ? ''
                                            : currentUser.motherName,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )),
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Native Place: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                      TextSpan(
                                        text: currentUser.motherNativePlace ==
                                                null
                                            ? ''
                                            : currentUser.motherNativePlace,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )),
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Occupation: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                      TextSpan(
                                        text:
                                            currentUser.motherOccupation == null
                                                ? ''
                                                : currentUser.motherOccupation,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )),
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Average Annual Income: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                      TextSpan(
                                        text: currentUser
                                                    .motherAvgAnnualIncome ==
                                                null
                                            ? ''
                                            : currentUser.motherAvgAnnualIncome,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                userImagesLength < 5
                    ? Container(
                        height: 0,
                      )
                    : UserImageCard(image: currentUser.imgUrls![4]),
                SizedBox(
                  height: 20,
                ),
                userImagesLength < 6
                    ? Container(
                        height: 0,
                      )
                    : UserImageCard(image: currentUser.imgUrls![5]),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
