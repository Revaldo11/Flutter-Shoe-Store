import 'package:flutter/material.dart';
import 'package:myshoe/theme.dart';
import 'package:myshoe/widgets/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/logo_shop_online.png',
                width: 50,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(80),
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color.fromARGB(255, 82, 72, 156),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/image_shoe.png',
                width: 54,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'COURT VISIO...',
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '\$57,15',
                    style: priceTextStyle.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/button_close.png',
              width: 22,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            ChatBubble(
              text: 'Hi, This item is still available?',
              isSender: true,
              hasProduct: true,
            ),
            ChatBubble(
              text: 'Good night, This item is only available in size 42 and 43',
              isSender: false,
            ),
            ChatBubble(
              text: 'Hi, This item is still available?',
              isSender: true,
              hasProduct: true,
            ),
            ChatBubble(
              text: 'Good night, This item is only available in size 42 and 43',
              isSender: false,
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: whiteColor,
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Typle Message...',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Image.asset('assets/button_send.png', width: 45),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xfffbfcfc),
      appBar: header(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: defaultMargin,
          ),
          // height: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height -
              header().preferredSize.height -
              defaultMargin,
          child: Column(
            children: [
              content(),
              chatInput(),
            ],
          ),
        ),
      ),
    );
  }
}
