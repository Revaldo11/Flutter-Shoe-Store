import 'package:flutter/material.dart';
import 'package:myshoe/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
            child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              Image.asset(
                'assets/image_profile.png',
                width: 64,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo, Valen',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '@valentyty',
                      style: subtitleTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-in', (route) => false);
                },
                child: Image.asset(
                  'assets/icon_exit.png',
                  width: 20,
                ),
              ),
            ],
          ),
        )),
      );
    }

    Widget menuItems(String text) {
      return Container(
        padding: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(
                fontWeight: reguler,
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Account',
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItems(
                  'Edit Profile',
                ),
              ),
              menuItems('Your Orders'),
              menuItems('Help'),
              SizedBox(height: 30),
              Text(
                'General',
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 16),
              ),
              menuItems('Privacy & Policy'),
              menuItems('Term of Service'),
              menuItems('Rate App'),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
