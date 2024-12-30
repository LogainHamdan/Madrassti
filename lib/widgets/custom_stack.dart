import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStack extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function() onTap;
  const CustomStack({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(3.0, 3.0),
                  blurRadius: 8.0.r,
                  spreadRadius: 2.0.r,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.sp, right: 8.sp, bottom: 20.sp),
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  height: 120.h,
                  width: 120.w,
                  fit: BoxFit.scaleDown,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'rubik',
                    color: Colors.black,
                    fontSize: 16.sp,
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
