// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uas_nayhan/components/btnNav.dart';
import 'package:uas_nayhan/utils/color.dart';

class WishlistDefault extends StatefulWidget {
  const WishlistDefault({super.key});

  @override
  State<WishlistDefault> createState() => _WishlistDefaultState();
}

class _WishlistDefaultState extends State<WishlistDefault> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: BtmNav(),
    );
  }
}
