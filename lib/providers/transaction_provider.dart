import 'package:flutter/foundation.dart';

import '../models/cart_model.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> cart, double totalPrice) async {
    try {
      if (await TransactionProvider().checkout(token, cart, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
