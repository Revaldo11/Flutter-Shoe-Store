import 'package:flutter/material.dart';
import 'package:myshoe/models/users_model.dart';
import 'package:myshoe/providers/auth_povider.dart';
import 'package:myshoe/theme.dart';
import 'package:myshoe/widgets/product_card.dart';
import 'package:myshoe/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 44,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    user.profilePhotoUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              ),
              child: Text(
                'All Shoes',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: 16,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparantColor,
                  border: Border.all(
                    color: subtitleColor,
                  )),
              child: Text(
                'Running',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: 16,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparantColor,
                  border: Border.all(
                    color: subtitleColor,
                  )),
              child: Text(
                'Training',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: 16,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparantColor,
                  border: Border.all(
                    color: subtitleColor,
                  )),
              child: Text(
                'Basketball',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: 16,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparantColor,
                  border: Border.all(
                    color: subtitleColor,
                  )),
              child: Text(
                'Hiking',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        // width: 192,
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          'Popular',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'New Product',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: [
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
