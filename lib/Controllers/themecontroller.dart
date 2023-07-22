import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController with WidgetsBindingObserver {
  static ThemeController get instance => Get.find();

  final _isDarkTheme = false.obs;
  final isRefreshing = true.obs;
  final _lightTheme = ThemeData.light().copyWith(
      useMaterial3: true,
      primaryColor: const Color(0xFFFBC700),
      primaryColorDark: const Color.fromARGB(255, 244, 213, 90),
      primaryColorLight: Colors.white,
      secondaryHeaderColor: Colors.grey,
      shadowColor: Colors.black
      // Add other colors specific to the light theme
      );
  final _darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      primaryColor: Colors.purple[600],
      primaryColorDark: const Color.fromARGB(255, 194, 92, 223),
      primaryColorLight: Colors.black,
      secondaryHeaderColor: Colors.grey,
      shadowColor: Colors.white
      // Add other colors specific to the dark theme
      );

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;
  ThemeData get currentTheme => _isDarkTheme.value ? darkTheme : lightTheme;

  RxBool isAlive = true.obs;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _loadThemeFromPreferences();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSystemDarkTheme =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    bool isDarkTheme = prefs.getBool('isDarkTheme') ?? isSystemDarkTheme;
    _isDarkTheme.value = isDarkTheme;
  }

  Future<void> _saveThemeToPreferences(bool isDarkTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDarkTheme);
  }

  void toggleTheme() {
    _isDarkTheme.toggle();
    _saveThemeToPreferences(_isDarkTheme.value);
  }

  @override
  void didChangePlatformBrightness() {
    bool isSystemDarkTheme =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    if (isSystemDarkTheme != _isDarkTheme.value) {
      _isDarkTheme.value = isSystemDarkTheme;
      _saveThemeToPreferences(_isDarkTheme.value);
    }
  }
}
