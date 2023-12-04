import 'package:flutter_crypto_app/HomeScreen/controller/homebinding.dart';
import 'package:flutter_crypto_app/HomeScreen/homescreen.dart';
import 'package:flutter_crypto_app/Nav-Bar/nav_barScreen.dart';
import 'package:flutter_crypto_app/splashScreen/splashscreen.dart';
import 'package:get/get.dart';

class myRoutes {
  static const splashScreen = "/splashScreen";
  static const homeScreen = "/homeScreen";
  static const navbarScreen = "/navbarscreen";
}

class Pages {
  static const splashScreen = myRoutes.splashScreen;
  static final routes = [
    GetPage(name: myRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: myRoutes.navbarScreen,
        page: () => const MyButtomNavBar(),
        binding: HomeBinding()),
  ];
}
