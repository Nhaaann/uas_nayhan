import 'package:flutter/material.dart';

class WishlistModel extends ChangeNotifier {
  List<WishlistItem> _wishlistItems = [];

  List<WishlistItem> get wishlistItems => _wishlistItems;

  void addItemToWishlist(WishlistItem item) {
    // Cek apakah item sudah ada dalam wishlist
    bool itemExists = false;

    for (WishlistItem wishlistItem in _wishlistItems) {
      if (wishlistItem.text == item.text) {
        // Item sudah ada dalam wishlist, bisa dihandle sesuai kebutuhan
        // Misalnya, tidak menambahkannya lagi atau menggantinya dengan yang baru.
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      // Item belum ada dalam wishlist, tambahkan ke wishlist
      _wishlistItems.add(item);
      notifyListeners();
    }
  }

  void closureWishlist(WishlistItem index) {
    bool isClosure = true;
    if (isClosure) {

    }
  }

  void removeFromWish(WishlistItem wish) {
    _wishlistItems.remove(wish);
    notifyListeners();
  }

  // Tambahkan fungsi lain yang mungkin diperlukan, seperti menghapus item dari wishlist.
}

class WishlistItem {
  final int harga;
  final String img;
  final String text;
  final String subtext;
  bool showHapusText;

  WishlistItem({
    required this.harga,
    required this.img,
    required this.text,
    required this.subtext,
    this.showHapusText = false,
  });
}
