// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class Product {
  String image;
  String text;
  String subtext;
  int harga;
  int jumlah;

  Product({
    required this.image,
    required this.text,
    required this.subtext,
    required this.harga,
    this.jumlah = 1,
  });
}

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];
  int _jumlah = 1;

  List<Product> get cartItems => _cartItems;
  int get jumlah => _jumlah;

  void addToCart(Product product) {
    bool productExists = false;

    for (Product cartProduct in _cartItems) {
      if (cartProduct.text == product.text) {
        cartProduct.jumlah += product.jumlah;
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      _cartItems.add(product);
    }

    notifyListeners();
    _jumlah = 0;
  }

  void resetJumlah() {
    _jumlah = 1;
    notifyListeners();
  }

  void removeBulkFromCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void tambah() {
    _jumlah++;
    notifyListeners();
  }

  void kurang() {
    if (_jumlah > 0) {
      _jumlah--;
      notifyListeners();
    }
  }

  // Implementasikan fungsi-fungsi lain yang diperlukan (misalnya, menghapus item dari keranjang).
}
