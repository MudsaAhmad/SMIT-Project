import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';


class CustomSnackBar extends StatelessWidget {
  final String message;
  final Color backgroundColor;

  const CustomSnackBar({
    super.key,
    required this.message,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 2),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: backgroundColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: DefaultTextStyle(
          style: GoogleFonts.inter(
            color: const Color(0xff3F3C36),
            fontSize: 14,fontWeight: FontWeight.w700,
          ),
          child: Row(
            children: [
              SizedBox(width: 15,),
              // SvgPicture.asset('assets/svg/error_msg_icon.svg',),
              // SizedBox(width: 10.w,),
              Expanded(
                child: Text(
                  message,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSnackBarUtils {
  static void showTopSnackBar(String message, Color backgroundColor) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final overlay = navigatorKey.currentState?.overlay; // Access the navigatorKey
      if (overlay == null) {
        print('Overlay is null----> ');
        return;
      }

      final overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: 20,
          left: 15,
          right: 15,
          child: CustomSnackBar(
            message: message,
            backgroundColor: backgroundColor,
          ),
        ),
      );

      overlay.insert(overlayEntry); // Insert the overlay entry

      Future.delayed(const Duration(seconds: 3), () {
        overlayEntry.remove(); // Remove the overlay after delay
      });
    });
  }
}