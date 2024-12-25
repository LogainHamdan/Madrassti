import 'package:finalproject/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalStories extends StatelessWidget {
  final List<String> storyImages;

  const HorizontalStories({required this.storyImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        child: ListView.separated(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kscaffoldBackgroundColor,
              ),
              child: ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purpleAccent, Colors.red, orangeColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.w), // Ensures the image fits well
                    child: ClipOval(
                      child: Image.asset(
                        storyImages[index],
                        fit: BoxFit
                            .cover, // Ensures the image fills the container
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 8.w),
          itemCount: storyImages.length,
        ));
  }
}
