import 'package:flutter_crypto_app/Api%20Services/api_calls.dart';
import 'package:flutter_crypto_app/HomeScreen/homescreen.dart';
import 'package:flutter_crypto_app/models/CoinModel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isloading = false.obs;
  RxList<CoinModel> coinModels = <CoinModel>[].obs;

  static HomeController instance = Get.find();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getCoinModels();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
  }

  getCoinModels() async {
    isloading.value = true;
    coinModels.value = await ApiServices().getCoinList();
    isloading.value = false;
  }
}
