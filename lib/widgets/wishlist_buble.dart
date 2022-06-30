import 'package:flutter/material.dart';
import 'package:myshoe/models/product_model.dart';
import 'package:myshoe/providers/product_provider.dart';
import 'package:myshoe/providers/wishlist_provider.dart';
import 'package:myshoe/theme.dart';
import 'package:provider/provider.dart';

class WishlistBubble extends StatelessWidget {
  const WishlistBubble({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider=Provider.of<WishlistProvider>(context);
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
            child: Image.network(
              product.galleries[0].url,
              width: 60,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                SizedBox(height: 2),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/icon_circle_favorite_active.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
