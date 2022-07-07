import 'package:flutter/material.dart';
import 'package:myshoe/providers/cart_provider.dart';
import 'package:myshoe/providers/page_provider.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import '../widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image_cart.png',
              width: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Opss! Your Cart is Empty',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle,
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                pageProvider.currentIndex = 0;
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Go Shopping',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle.copyWith(
                      fontWeight: reguler,
                    ),
                  ),
                  Text(
                    '\$${cartProvider.totalPrice()}',
                    style: priceTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 10),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Divider(
              thickness: 0.3,
              color: Colors.grey,
            ),
            SizedBox(height: 30),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: cartProvider.cart
            .map((product) => CartCard(
                  cart: product,
                ))
            .toList(),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor1,
      body: cartProvider.cart.isEmpty ? emptyCart() : content(),
      bottomNavigationBar:
          cartProvider.cart.isEmpty ? SizedBox() : customBottomNav(),
    );
  }
}
