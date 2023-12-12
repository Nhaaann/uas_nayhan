// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:uas_nayhan/utils/flushbar.dart';
// import 'package:flutter_flushbar/flutter_flushbar.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Notifikasi Animasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Flushbar(
                  title: 'Hey Ninja',
                  message:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  duration: Duration(milliseconds: 900),
                ).show(context);
              },
              child: Text('hello'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Like Button Example'),
//         ),
//         body: Center(
//           child: LikeButton(
//             size: 40,
//             circleColor: CircleColor(start: Colors.red, end: Colors.redAccent),
//             bubblesColor: BubblesColor(
//               dotPrimaryColor: Colors.red,
//               dotSecondaryColor: Colors.redAccent,
//             ),
//             likeBuilder: (bool isLiked) {
//               // Custom animasi saat tombol "Like" diklik kembali
//               return AnimatedSwitcher(
//                 duration: Duration(milliseconds: 500),
//                 child: isLiked
//                     ? Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                         size: 40,
//                         key: ValueKey<bool>(isLiked),
//                       )
//                     : Icon(
//                         Icons.favorite_border_outlined,
//                         color: Colors.grey,
//                         size: 40,
//                         key: ValueKey<bool>(isLiked),
//                       ),
//               );
//             },
//             onTap: (bool isLiked) async {
//               // Tambahkan delay sebelum mengembalikan nilai
//               return !isLiked;
//             },
//             // animationDuration:
//             //     Duration(milliseconds: 500), // Sesuaikan durasi animasi
//           ),
//         ),
//       ),
//     );
//   }
// }
