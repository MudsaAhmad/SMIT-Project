import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgeAchieveScreen extends StatefulWidget {
  const BadgeAchieveScreen({super.key});

  @override
  State<BadgeAchieveScreen> createState() => _BadgeAchieveScreenState();
}

class _BadgeAchieveScreenState extends State<BadgeAchieveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/Layer 2.png', // Change to your actual image path
              fit: BoxFit.cover,
            ),
          ),

          // Main Content
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You’re just earned a new badge',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xff3F3F3F),
                  ),
                ),
                SizedBox(height: 33.h),
                Image.asset(
                  'assets/Silver Medal.png',
                  height: 186.h,
                  width: 140.w,
                ),
                SizedBox(height: 33.h),
                Text(
                  'Silver Running Badge',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff3F3F3F),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Congratulations, William! You just\nearned the silver running badge',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff3F3F3F),
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    print('tapped--------------->');
                  },
                  child: Container(
                    height: 41.w,
                    width: 195.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff76A94E),
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color: const Color(0xff76A94E),
                        width: 2.sp,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff3A6815),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: GoogleFonts.inter(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
