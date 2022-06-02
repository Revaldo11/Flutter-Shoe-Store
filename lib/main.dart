import 'package:flutter/material.dart';
import 'package:myshoe/screens/cart_screen.dart';
import 'package:myshoe/screens/checkout_screen.dart';
import 'package:myshoe/screens/checkout_success.dart';
import 'package:myshoe/screens/detail_chat_screen.dart';
import 'package:myshoe/screens/edit_profile_screen.dart';
import 'package:myshoe/screens/home/main_page.dart';
import 'package:myshoe/screens/detail_product_screen.dart';
import 'package:myshoe/screens/sign_up_screen.dart';
import 'package:myshoe/screens/sign_in_screen.dart';
import 'package:myshoe/screens/custom_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MyCustomSplashScreen(),
        '/sign-in': (context) => SignInScreen(),
        '/sign-up': (context) => SignUpScreen(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfileScreen(),
        '/product': (context) => ProductScreen(),
        '/cart': (context) => CartScreen(),
        '/checkout': (context) => CheckoutScreen(),
        '/checkout_success': (context) => CheckoutSuccess(),
      },
    );
  }
}
