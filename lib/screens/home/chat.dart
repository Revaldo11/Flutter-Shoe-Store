import 'package:flutter/material.dart';
import 'package:myshoe/theme.dart';
import 'package:myshoe/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  Widget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Message Support',
        style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: bold),
      ),
    );
  }

  Widget emptyChat() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/image_message.png',
          width: 80,
        ),
        SizedBox(height: 20),
        Text(
          'Opss no message yet?',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'You have never done a transaction',
          style: secondaryTextStyle,
        ),
        SizedBox(height: 20),
        Container(
          color: transparantColor,
          height: 44,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Explore Store',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget content() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: backgroundColor1,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            ChatTile(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
