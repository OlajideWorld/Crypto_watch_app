import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/routes/routes.dart';
import 'package:flutter_crypto_app/utils/size-config.dart';
import 'package:get/get.dart';

import 'HomeScreen/controller/homebinding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      return GetMaterialApp(
        title: 'Flutter CryptoCurrency App',
        theme: ThemeData.light(), // Set the light theme as the default
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
        getPages: Pages.routes,
        initialRoute: Pages.splashScreen,
      );
    });
  }
}
