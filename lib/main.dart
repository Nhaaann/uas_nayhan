// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_nayhan/DefaultPage.dart';
import 'package:uas_nayhan/components/provider/btnNav_provider.dart';
import 'package:uas_nayhan/page/keranjang/model/model.dart';
import 'package:uas_nayhan/page/wishlist/model/model.dart';
import 'package:uas_nayhan/splash.dart';
import 'package:uas_nayhan/utils/color.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WishlistModel()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(
            create: (context) => NavigationProvider(), child: MyApp()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: white,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Splash();
          } else {
            return DefaultPage();
          }
        },
      ),
    );
  }
}
