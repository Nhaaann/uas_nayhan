// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:uas_nayhan/utils/color.dart';

class TextLihatSemua extends StatelessWidget {
  const TextLihatSemua({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Lihat semua',
        style: TextStyle(
          color: primary,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
