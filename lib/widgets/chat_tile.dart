import 'package:flutter/material.dart';
import 'package:myshoe/models/message_model.dart';
import 'package:myshoe/models/product_model.dart';
import 'package:myshoe/screens/detail_chat_screen.dart';
import 'package:myshoe/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChatPage(
              product: UninitializedProductModel(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icon_store_shoe.png',
                  width: 54,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        message.message,
                        style: secondaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10,
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            Divider(
              thickness: 1,
              color: Color.fromARGB(255, 214, 214, 214),
            ),
          ],
        ),
      ),
    );
  }
}
