// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:uas_nayhan/utils/flushbar.dart';
import 'package:uas_nayhan/page/keranjang/model/model.dart';
import 'package:uas_nayhan/page/wishlist/model/model.dart';
import 'package:uas_nayhan/utils/color.dart';
import 'dart:async';
import '../keranjang/keranjang.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final TextEditingController searchController = TextEditingController();

  List<WishlistItem> wishlistItems = [];
  List<WishlistItem> displayItems = [];

  @override
  void initState() {
    super.initState();
    wishlistItems =
        Provider.of<WishlistModel>(context, listen: false).wishlistItems;
    displayItems = List.of(wishlistItems);
  }

  void filterItems(String value) {
    setState(() {
      displayItems = wishlistItems
          .where((element) =>
              element.text.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void removeItemFromWishlist(WishlistItem item) {
    // Remove the item from the wishlistItems list
    Provider.of<WishlistModel>(context, listen: false).removeFromWish(item);

    // Update the displayItems list to reflect the changes
    setState(() {
      displayItems.remove(item);
    });

    // Show Flushbar after removing the item
  }

  void showFlushbar(String message) {
    Flushbar(
      message: message,
      duration: Duration(milliseconds: 1450),
    )..show(context);
  }

  bool closure = true;

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 1.2,
        toolbarHeight: 80,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "WishList",
                  style: TextStyle(
                    color: primaryText,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      LucideIcons.search,
                      color: primaryText,
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Keranjang();
                          },
                        ));
                      },
                      child: Icon(
                        LucideIcons.shoppingCart,
                        color: primaryText,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                onChanged: (value) {
                  filterItems(value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5),
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: secondText,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Cari barang impianmu',
                  prefixIcon: Column(
                    children: [
                      SizedBox(height: 10),
                      Icon(
                        Iconsax.search_normal_1,
                        size: 20,
                        color: primaryText,
                      ),
                    ],
                  ),
                  fillColor: white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xffE7E7E7)),
                  ),
                  focusColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue), // Change color for focused state
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xffE7E7E7)),
                      borderRadius: BorderRadius.zero),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        wishlistItems.length.toString(),
                        style: TextStyle(
                          color: primaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' barang',
                        style: TextStyle(
                          color: secondText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Icon(LucideIcons.list)
                ],
              ),
              Consumer<WishlistModel>(
                builder: (context, wishProvider, child) {
                  return _List(screenWidth, wishProvider);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _List(double screenWidth, WishlistModel wishProvider) {
    return Container(
      width: screenWidth,
      height: 576,
      child: displayItems.isEmpty
          ? Center(
              child: Text('${searchController.text} gaada'),
            )
          : ListView.builder(
              itemCount: displayItems.length,
              itemBuilder: (context, index) {
                WishlistItem item = displayItems[index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(item.img, width: 99, height: 99),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    item.text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: primaryText,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    item.showHapusText
                                        ? GestureDetector(
                                            onTap: () {
                                              NotificationUtils.showNotification(
                                                  context,
                                                  'item removed from Wishlist',
                                                  268);
                                              Future.delayed(
                                                  Duration(milliseconds: 2500),
                                                  () {
                                                removeItemFromWishlist(item);
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 4),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4,
                                                vertical: 1,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    width: 1,
                                                    color: primaryText
                                                        .withOpacity(0.6)),
                                              ),
                                              child: Text(
                                                'hapus',
                                                style: TextStyle(
                                                    color: primaryText),
                                              ),
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item.showHapusText =
                                              !item.showHapusText;
                                        });
                                      },
                                      child: Icon(
                                        LucideIcons.moreVertical,
                                        color: primaryText,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 6),
                            Container(
                              width: screenWidth / 1.5,
                              child: Text(
                                item.subtext,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: secondText,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: 'Rp.',
                                          decimalDigits: 0)
                                      .format(item.harga)
                                      .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: primaryText,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Consumer<CartProvider>(
                              builder: (context, cartProvider, child) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.white,
                                    primary: Colors.white, // Background color
                                    side: BorderSide(
                                        color: primary), // Border color
                                  ),
                                  onPressed: () {
                                    cartProvider.addToCart(
                                      Product(
                                        image: item.img,
                                        text: item.text,
                                        subtext: item.subtext,
                                        harga: item.harga,
                                      ),
                                    );
                                    NotificationUtils.showNotification(
                                      context,
                                      'Add to cart',
                                      150,
                                    );
                                  },
                                  child: Container(
                                    width: screenWidth,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Tambah Keranjang',
                                        style: TextStyle(
                                          color: primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
