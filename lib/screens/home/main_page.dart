import 'package:flutter/material.dart';
import 'package:myshoe/screens/cart_screen.dart';
import 'package:myshoe/screens/home/chat.dart';
import 'package:myshoe/screens/home/home.dart';
import 'package:myshoe/screens/home/profile_page.dart';
import 'package:myshoe/screens/home/wishlist_page.dart';
import 'package:myshoe/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(1, 1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-1, -1),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ]),
        child: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            backgroundColor: backgroundColor1,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              color: primaryColor,
            ),
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_home.png',
                    color: currentIndex == 0 ? primaryColor : Color(0xff808191),
                    width: 21,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_chat.png',
                    color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                    width: 20,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_cart_white.png',
                    color: currentIndex == 2 ? primaryColor : Color(0xff808191),
                    width: 20,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_favorite.png',
                    color: currentIndex == 3 ? primaryColor : Color(0xff808191),
                    width: 20,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    color: currentIndex == 4 ? primaryColor : Color(0xff808191),
                    width: 18,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 2:
          return CartScreen();
        case 3:
          return WishlistPage();
        case 4:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      body: body(),
    );
  }
}
