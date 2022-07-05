import 'package:flutter/cupertino.dart';
import 'package:myshoe/models/product_model.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cart = [];
  List<CartModel> get cart => _cart;

  // make setter for cart
  set cart(List<CartModel> cart) {
    _cart = cart;
    notifyListeners();
  }

  // function add product to cart
  addCart(ProductModel product) {
    if (productExist(product)) {
      // if product exist, increase quantity
      int index =
          _cart.indexWhere((element) => element.product.id == product.id);
      _cart[index].quantity++;
    } else {
      // if product not exist, add new product
      _cart.add(CartModel(
        id: _cart.length,
        product: product,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  removeCart(int id) {
    _cart.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _cart[id].quantity++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _cart[id].quantity--;
    if (_cart[id].quantity == 0) {
      removeCart(id);
    }
    notifyListeners();
  }

  totalItem() {
    int total = 0;
    for (var item in _cart) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _cart) {
      total += (item.quantity * item.product.price);
    }
    return total;
  }

  // function check product, already in cart or not
  productExist(ProductModel product) {
    if (_cart.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
