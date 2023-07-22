import 'package:flutter_crypto_app/HomeScreen/homescreen.dart';
import 'package:flutter_crypto_app/splashScreen/splashscreen.dart';
import 'package:get/get.dart';

class myRoutes {
  static const splashScreen = "/splashScreen";
  static const homeScreen = "/homeScreen";
}

class Pages {
  static const splashScreen = myRoutes.splashScreen;
  static final routes = [
   GetPage(name: myRoutes.splashScreen, page: ()=> const SplashScreen()),
    GetPage(name: myRoutes.homeScreen, page: () => const HomeScreen()),
  ];
}
