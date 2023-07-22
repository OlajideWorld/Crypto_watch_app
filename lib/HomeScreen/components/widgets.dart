import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/utils/sizes.dart';

import '../../Controllers/themecontroller.dart';

amnountWidget(BuildContext context) {
  final _theme = ThemeController.instance.currentTheme;
  final myHeight = MediaQuery.of(context).size.height;
  final myWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$ 7,466.20",
              style: TextStyle(
                  fontSize: fontSize(40),
                  color: _theme.shadowColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: heightSize(15)),
            Text("+162% all Time",
                style: TextStyle(
                    fontSize: fontSize(15), color: _theme.shadowColor)),
          ],
        ),
        Container(
          height: heightSize(30),
          decoration: BoxDecoration(
              color: _theme.primaryColorLight.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Icon(
            Icons.image_outlined,
            color: _theme.primaryColor,
            size: myHeight * 0.03,
          ),
        )
      ],
    ),
  );
}
