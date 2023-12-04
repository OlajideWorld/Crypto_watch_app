import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/Controllers/themecontroller.dart';
import 'package:flutter_crypto_app/models/CoinModel.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

final _theme = ThemeController();

class ApiServices {
  final client = http.Client();

  Future<List<CoinModel>> getCoinList() async {
    debugPrint("======= Making API Call ========");
    RxList<CoinModel> coinModel = <CoinModel>[].obs;
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      final url = Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true");

      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        coinModel.value = coinModelFromJson(response.body);
      }

      debugPrint("======= API Call made ========");
    } catch (e) {
      debugPrint("==== Error Occurred ======");
      debugPrint(e.toString());
    }
    return coinModel;
  }
}
