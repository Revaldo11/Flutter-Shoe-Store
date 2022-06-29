import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:myshoe/models/product_model.dart';

class ProductService {
  var baseUrl = 'http://myshoe-api.revaldoputra.my.id/api';

  Future<List<ProductModel>> getProduct() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    debugPrint(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(
          ProductModel.fromJson(item),
        );
      }
      return products;
    } else {
      throw Exception('Gagal Get Product!');
    }
  }
}
