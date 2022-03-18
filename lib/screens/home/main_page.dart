import 'package:flutter/material.dart';
import 'package:myshoe/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonCart() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {},
        child: Image.asset(
          'assets/icon_cart_white.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_home.png',
                  width: 21,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_chat.png',
                  width: 20,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_favorite.png',
                  width: 20,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_profile.png',
                  width: 18,
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: buttonCart(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      backgroundColor: backgroundColor1,
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
