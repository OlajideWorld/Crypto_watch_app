import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/HomeScreen/components/itemsWidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_crypto_app/HomeScreen/components/widgets.dart';
import 'package:flutter_crypto_app/utils/sizes.dart';

import '../Controllers/themecontroller.dart';
import '../models/CoinModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getCoinPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = ThemeController.instance.currentTheme;
    final myHeight = MediaQuery.of(context).size.height;
    final myWidth = MediaQuery.of(context).size.width;

    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: myHeight,
          width: myWidth,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                _theme.primaryColorDark,
                _theme.primaryColor,
              ])),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: widthSize(10),
                              vertical: heightSize(5)),
                          height: heightSize(30),
                          decoration: BoxDecoration(
                              color: _theme.primaryColorLight.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
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
                  height: myHeight * 0.7,
                  width: myWidth,
                  decoration: BoxDecoration(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            size: myHeight * 0.03,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: isRefreshing == true
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: _theme.primaryColor),
                              )
                            : ListView.builder(
                                itemCount: 4,
                                // itemCount: 4,
                                itemBuilder: (context, index) {
                                  return ItemsDisplay(
                                      items: coinMarket[index]);
                                }))
                  ]),
                )
              ]),
        );
      },
    ));
  }

  bool isRefreshing = true;
  List<CoinModel> coinMarket = [];

  Future<List<CoinModel>?> getCoinPrice() async {
    try {
      debugPrint("====== making API Call =======");

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      final url = Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true");

      debugPrint(url.toString());

      var response = await http.get(url, headers: headers);

      debugPrint(response.body);

      debugPrint("======= API Call made ========");
      setState(() {
        isRefreshing = false;
      });

      if (response.statusCode == 200) {
        var x = response.body;
        List<CoinModel> coinMarketCap = coinModelFromJson(x);

        setState(() {
          coinMarket = coinMarketCap;
        });

        debugPrint(coinMarket.toString());
      } else {
        debugPrint(response.body);
      }
    } catch (e) {
      debugPrint("==== Error Occurred ======");
      debugPrint(e.toString());
    }
  }
}
