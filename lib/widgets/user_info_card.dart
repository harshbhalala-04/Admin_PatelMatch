// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  //const UserInfoCard({Key? key}) : super(key: key);
  final title;
  final subTitle;

  UserInfoCard({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return subTitle != null && subTitle != ''
        ? Container(
            width: 150,
            child: Card(
              elevation: 2.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  subTitle,
                  style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        : Container(
            width: 0,
          );
  }
}
