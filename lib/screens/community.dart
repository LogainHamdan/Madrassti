import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '';
import '../core/util/constants.dart';
import '../data/posts.dart';
import '../data/story_imgs.dart';
import '../widgets/header.dart';
import '../widgets/post_list.dart';
import '../widgets/stories.dart';

class Community extends StatelessWidget {
  static const id = '/com';

  // Generates dynamic post data
  final List<Map<String, dynamic>> posts = getPosts; // Generates 20 posts

  final List<String> storyImages = getStoryImgs;

  Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kscaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Header(),
              SizedBox(height: 30.sp),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'قصص مميزة',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kprimaryColor,
                    fontFamily: 'rubik',
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              HorizontalStories(storyImages: storyImages),
              SizedBox(height: 18.h),
              PostsList(posts: posts), // Using dynamic data here
            ],
          ),
        ),
      ),
    );
  }
}
