import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:uas_nayhan/utils/color.dart';

class NotificationUtils {
  static void showNotification(
      BuildContext context, String message, double width) {
    _buildFlushbar(message, width).show(context);
  }

  static Flushbar _buildFlushbar(String message, double width) {
    return Flushbar(
      margin: EdgeInsets.only(bottom: 22),
      backgroundColor: primary.withOpacity(0.95),
      messageText: Container(
        margin: EdgeInsets.only(left: 6, top: 1),
        child: Text(
          message,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      message: '1',
      duration: Duration(milliseconds: 950),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      borderRadius: BorderRadius.circular(999),
      maxWidth: width,
      reverseAnimationCurve: Curves.bounceInOut,
      shouldIconPulse: false,
      icon: Container(
        margin: EdgeInsets.only(left: 12),
        child: Icon(
          LucideIcons.checkCircle2,
          size: 26,
          color: Colors.white,
        ),
      ),
    );
  }
}
