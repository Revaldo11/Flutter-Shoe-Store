import 'package:flutter/material.dart';
import 'package:myshoe/theme.dart';

class CartCard extends StatefulWidget {
  CartCard({Key? key}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
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
                      'Terrex Urban Low',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$143,98',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _incrementCounter();
                    },
                    child: Image.asset(
                      'assets/icon_add.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$_counter',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      _decrementCounter();
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
          Row(
            children: [
              Image.asset('assets/icon_trash.png', width: 10),
              SizedBox(width: 4),
              Text(
                'Remove',
                style: alertTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
