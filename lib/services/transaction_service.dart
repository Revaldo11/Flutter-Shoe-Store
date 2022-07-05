import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/cart_model.dart';

class TransactionService {
  // var baseUrl = 'https://myshoe-api.revaldoputra.my.id/api';
  var baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
      String token, List<CartModel> cart, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode(
      {
        'address': 'Surabaya',
        'items': cart
            .map((cart) => {
                  'id': cart.product.id,
                  'quantity': cart.quantity,
                })
            .toList(),
        'status': 'PENDING',
        'total_price': totalPrice,
        'shipping_price': 0,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Transaksi Checkout gagal');
    }
  }
}
