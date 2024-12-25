import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostItem extends StatelessWidget {
  final String name;
  final int time;
  final String timeUnit;
  final String imagePath;

  const PostItem({
    required this.name,
    required this.time,
    required this.imagePath,
    required this.timeUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.asset(
            imagePath,
            height: 300.h,
            width: 400.w,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Row(
                children: [
                  const Icon(Icons.favorite, color: Colors.red),
                  const Icon(Icons.more_vert, color: Colors.grey),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'rubik',
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  _getTimeText()
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getTimeText() {
    switch (timeUnit) {
      case 'm':
        return Text(
          'قبل $time دقائق',
          style: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Rubik',
            fontSize: 14,
          ),
        );
      case 's':
        return Text(
          'قبل $time ثوان',
          style: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Rubik',
            fontSize: 14,
          ),
        );
      default:
        return Text(
          'قبل $timeساعة', // Default to seconds if no match
          style: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Rubik',
            fontSize: 14,
          ),
        );
    }
  }
}
