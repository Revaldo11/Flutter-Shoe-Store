import 'package:flutter/material.dart';
import 'package:myshoe/models/cart_model.dart';
import 'package:myshoe/providers/cart_provider.dart';
import 'package:myshoe/theme.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  CartCard({Key? key, required this.cart}) : super(key: key);
  final CartModel cart;
  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(6, 6),
            blurRadius: 15,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-6, -6),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.cart.product.galleries[0].url,
                  width: 60,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cart.product.name,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$${widget.cart.product.price}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(widget.cart.id);
                    },
                    child: Image.asset(
                      'assets/icon_add.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(widget.cart.id);
                    },
                    child: Image.asset('assets/icon_remove.png', width: 16),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Size:',
                  style: secondaryTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ),
              Text(
                'M',
                style: primaryTextStyle.copyWith(fontWeight: medium),
              ),
            ],
          ),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(widget.cart.id);
            },
            child: Row(
              children: [
                Image.asset('assets/icon_trash.png', width: 10),
                SizedBox(width: 4),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
