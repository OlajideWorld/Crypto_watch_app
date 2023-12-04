import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/HomeScreen/components/itemsWidget.dart';
import 'package:flutter_crypto_app/HomeScreen/components/itemwidget2.dart';
import 'package:flutter_crypto_app/HomeScreen/controller/homecontroller.dart';
import 'package:flutter_crypto_app/common/custom_text.dart';
import 'package:get/get.dart';

import 'package:flutter_crypto_app/HomeScreen/components/amount_widgets.dart';
import 'package:flutter_crypto_app/utils/sizes.dart';

import '../Controllers/themecontroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = ThemeController.instance.currentTheme;
    final HomeController controller = HomeController.instance;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Obx(() {
              return Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      _theme.primaryColorDark,
                      _theme.primaryColor,
                    ])),
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SafeArea(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: heightSize(10),
                                  left: widthSize(20),
                                  right: widthSize(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: widthSize(10),
                                        vertical: heightSize(5)),
                                    height: heightSize(30),
                                    decoration: BoxDecoration(
                                        color: _theme.primaryColorLight
                                            .withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      "Main Portfolio",
                                      style: TextStyle(
                                          fontSize: fontSize(15),
                                          color: _theme.shadowColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "Top 10 Coins",
                                    style: TextStyle(
                                        fontSize: fontSize(15),
                                        color: _theme.shadowColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Experimental",
                                    style: TextStyle(
                                        fontSize: fontSize(15),
                                        color: _theme.shadowColor,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: heightSize(20)),
                          amnountWidget(context),
                          SizedBox(height: heightSize(20)),
                          Container(
                            height: constraints.maxHeight * 0.95,
                            width: constraints.maxWidth,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.grey.shade200,
                                      spreadRadius: 3,
                                      offset: const Offset(0, 5))
                                ],
                                color: _theme.primaryColorLight,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(widthSize(50)),
                                    topRight: Radius.circular(widthSize(50)))),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: heightSize(30),
                                    right: widthSize(30),
                                    left: widthSize(30)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Assets",
                                      style: TextStyle(
                                          fontSize: fontSize(15),
                                          fontWeight: FontWeight.bold,
                                          color: _theme.shadowColor),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: _theme.shadowColor,
                                      size: constraints.maxHeight * 0.03,
                                    )
                                  ],
                                ),
                              ),
                              controller.isloading.value == true
                                  ? Center(
                                      child: CircularProgressIndicator(
                                          color: _theme.primaryColor),
                                    )
                                  : SizedBox(
                                      height: heightSize(500),
                                      child: ListView.builder(
                                          itemCount:
                                              controller.coinModels.length ~/ 3,
                                          shrinkWrap: true,
                                          // physics:
                                          //     const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return ItemsDisplay(
                                                items: controller
                                                    .coinModels[index],
                                                height: constraints.maxHeight,
                                                width: constraints.maxWidth);
                                          }),
                                    ),
                              SizedBox(height: heightSize(10)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.05),
                                child: const Row(children: [
                                  CText(
                                    text: "Recommend to Buy",
                                    size: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ]),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.01),
                              controller.isloading.value == true
                                  ? Center(
                                      child: CircularProgressIndicator(
                                          color: _theme.primaryColor),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          left: constraints.maxWidth * 0.03),
                                      child: SizedBox(
                                        height: heightSize(160),
                                        child: ListView.builder(
                                            itemCount:
                                                controller.coinModels.length ~/
                                                    3,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return ItemWidget2(
                                                  items: controller
                                                      .coinModels[index],
                                                  height: constraints.maxHeight,
                                                  width: constraints.maxWidth);
                                            }),
                                      ),
                                    ),
                              SizedBox(height: constraints.maxHeight * 0.01),
                            ]),
                          )
                        ]),
                  ),
                ),
              );
            });
          },
        ));
  }
}
