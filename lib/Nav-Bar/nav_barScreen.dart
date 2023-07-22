import "package:flutter/material.dart";
import "package:flutter_crypto_app/Controllers/themecontroller.dart";
import "package:flutter_crypto_app/HomeScreen/homescreen.dart";

class MyButtomNavBar extends StatefulWidget {
  const MyButtomNavBar({super.key});

  @override
  State<MyButtomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyButtomNavBar> {
  int currrentIndex = 0;

  List<Widget> pages = [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    final _theme = ThemeController.instance.currentTheme;
    final myHeight = MediaQuery.of(context).size.height;
    final myWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: _theme.primaryColorLight,
          body: pages.elementAt(currrentIndex),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currrentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: _theme.primaryColor,
              unselectedItemColor: _theme.shadowColor,
              backgroundColor: _theme.primaryColorLight,
              // type: BottomNavigationBarType.fixed,
              onTap: (value) {
                setState(() {
                  currrentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined, size: myHeight * 0.03),
                    label: "",
                    activeIcon: Icon(
                      Icons.home_filled,
                      size: myHeight * 0.03,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.connect_without_contact_outlined,
                        size: myHeight * 0.03),
                    label: "",
                    activeIcon: Icon(
                      Icons.connect_without_contact,
                      size: myHeight * 0.03,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_none_outlined,
                        size: myHeight * 0.03),
                    label: "",
                    activeIcon: Icon(
                      Icons.notifications,
                      size: myHeight * 0.03,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined, size: myHeight * 0.03),
                    label: "",
                    activeIcon: Icon(
                      Icons.person_2,
                      size: myHeight * 0.03,
                    ))
              ]),
        );
      },
    );
  }
}
