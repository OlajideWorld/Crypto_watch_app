import 'package:flutter_crypto_app/HomeScreen/controller/homecontroller.dart';
import 'package:get/get.dart';

import '../../Controllers/themecontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ThemeController>(ThemeController());
  }
}
