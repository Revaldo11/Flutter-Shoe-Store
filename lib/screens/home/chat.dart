import 'package:flutter/material.dart';
import 'package:myshoe/models/message_model.dart';
import 'package:myshoe/providers/auth_povider.dart';
import 'package:myshoe/providers/page_provider.dart';
import 'package:myshoe/services/message_service.dart';
import 'package:myshoe/theme.dart';
import 'package:myshoe/widgets/chat_tile.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

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
      return Expanded(
        child: Container(
          width: double.infinity,
          color: Color(0xfffbfcfc),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image_message.png',
                width: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Opss no message yet?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'You have never done a transaction',
                style: secondaryTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream:
              MessageService().getMessageByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            // jika data ada maka tampilkan list message else tampilkan empty chat
            if (snapshot.hasData) {
              // jika user tidak memiliki message maka tampilkan empty chat
              if (snapshot.data!.isEmpty) {
                return emptyChat();
              }
              return Expanded(
                child: Container(
                  width: double.infinity,
                  color: backgroundColor1,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    children: [
                      ChatTile(
                        message: snapshot.data![snapshot.data!.length - 1],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
