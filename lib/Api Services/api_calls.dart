import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/Controllers/themecontroller.dart';
import 'package:flutter_crypto_app/models/CoinModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final _theme = ThemeController();

class ApiServices {
  final client = http.Client();

  Future getCoinList() async {
    debugPrint("======= Making API Call ========");
    try {
      var x;
      debugPrint(x);

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      final url = Uri.parse(
          "https://pro-api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true");

      var response = await client.get(url, headers: headers);

      debugPrint("======= API Call made ========");

      if (response.statusCode == 200) {
        _theme.isRefreshing.value = false;
        x = coinModelFromJson(response.body);
      }
      return x;
    } catch (e) {
      debugPrint("==== Error Occurred ======");
      debugPrint(e.toString());
    }
  }
}
