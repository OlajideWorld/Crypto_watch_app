import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/Nav-Bar/nav_barScreen.dart';
import 'package:flutter_crypto_app/utils/sizes.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../Controllers/themecontroller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = ThemeController.instance.currentTheme;
    final myHeight = MediaQuery.of(context).size.height;
    final myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: _theme.primaryColorLight,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widthSize(20), vertical: heightSize(50)),
                child: Column(
                  children: [
                    Lottie.asset("assets/lottie/animation6.json"),
                    SizedBox(height: heightSize(30)),
                    Center(
                      child: Text(
                        "The Future",
                        style: TextStyle(
                            fontSize: fontSize(50),
                            color: _theme.shadowColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: heightSize(10)),
                    Text(
                      "Learn more about Cryptocurrency look to",
                      style: TextStyle(
                          fontSize: fontSize(15),
                          color: _theme.shadowColor,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "  the future of 10 Crypto",
                      style: TextStyle(
                          fontSize: fontSize(15),
                          color: _theme.shadowColor,
                          fontWeight: FontWeight.normal),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Get.to(() => const MyButtomNavBar(),
                          curve: Curves.easeIn),
                      child: Container(
                        height: heightSize(50),
                        width: widthSize(myWidth),
                        decoration: BoxDecoration(
                            color: _theme.primaryColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(10)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "CREATE PORTFOLIO",
                              style: TextStyle(
                                fontSize: fontSize(20),
                                fontWeight: FontWeight.bold,
                                color: _theme.shadowColor,
                              ),
                            ),
                            const RotationTransition(
                              turns: AlwaysStoppedAnimation(310 / 360),
                              child: Icon(Icons.arrow_forward_rounded),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
