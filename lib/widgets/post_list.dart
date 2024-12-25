import 'package:finalproject/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostsList extends StatelessWidget {
  final List<Map<String, dynamic>> posts;

  const PostsList({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostItem(
            name: post['name']!,
            time: post['time']!,
            imagePath: post['imagePath']!,
            timeUnit: post['timeUnit']!,
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: posts.length,
      ),
    );
  }
}
