import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/widgets/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home.dart';

class MeetingsRoomScreen extends StatelessWidget {
  static const id = '/room';
  MeetingsRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        child: MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/meetings room.png',
                    height: 100.h,
                    width: 100.w,
                  ),
                  Text(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          fontFamily: 'rubik'),
                      'قاعة الاجتماعات'),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: kprimaryColor,
                    ),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, HomePage.id),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomStack(
                    bottomPadding: 0,
                    title: 'المواعيد',
                    imagePath: 'assets/images/virtual_classes.png',
                    onTap: () {}),
                CustomStack(
                    bottomPadding: 0,
                    title: 'أنشئ/انضم لاجتماع',
                    imagePath: 'assets/images/educational_platform.png',
                    onTap: () {}),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
