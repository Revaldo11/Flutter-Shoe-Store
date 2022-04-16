import 'package:flutter/material.dart';
import 'package:myshoe/theme.dart';

class WishlistBubble extends StatelessWidget {
  const WishlistBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 24, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_shoe.png',
              width: 60,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Predator 20.3 Firm Ground Boots',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                SizedBox(height: 2),
                Text(
                  '\$68,98',
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          Image.asset('assets/icon_circle_favorite_active.png', width: 34),
        ],
      ),
    );
  }
}
