import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:uas_nayhan/components/provider/btnNav_provider.dart';
import 'package:uas_nayhan/page/home/home.dart';
import 'package:uas_nayhan/page/inspirasi/Inspirasi.dart';
import 'package:uas_nayhan/page/profile/profile.dart';
import 'package:uas_nayhan/page/wishlist/wishlist.dart';
import 'package:uas_nayhan/utils/color.dart';

class BtmNav extends StatefulWidget {
  @override
  State<BtmNav> createState() => _BtmNavState();
}

class _BtmNavState extends State<BtmNav> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: context.read<NavigationProvider>().selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: PageView(
        controller: _pageController,
        children: const [
          Home(),
          InspirasiBody(),
          Wishlist(),
          Profil(),
        ],
        onPageChanged: (index) {
          setState(() {
            context.read<NavigationProvider>().selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme:
            IconThemeData(color: Color(0xff1B1B1B).withOpacity(0.8)),
        unselectedLabelStyle: TextStyle(color: secondText),
        currentIndex: context.watch<NavigationProvider>().selectedIndex,
        selectedItemColor: primary,
        onTap: (index) {
          setState(() {
            context.read<NavigationProvider>().selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              LucideIcons.home,
              size: 26,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.coffee, size: 26),
            label: 'Inspirasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart, size: 26),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle, size: 26),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
