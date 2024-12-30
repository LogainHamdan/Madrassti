import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/screens/apointments.dart';
import 'package:finalproject/screens/meetings-room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/fields.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom_stack.dart';
import '../widgets/(repeated) navigation_container.dart';
import 'chats.dart';
import 'community.dart';

class HomePage extends StatelessWidget {
  static const id = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fieldProvider = context.read<FieldProvider>();

    return ScreenUtilInit(
      child: SafeArea(
        child: MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Container(
                        height: 200.h,
                        width: 450.w,
                        decoration: BoxDecoration(
                          color: kprimaryColor,
                          gradient: LinearGradient(
                            colors: [kprimaryColor, kinProgressStatus],
                          ),
                          borderRadius: BorderRadius.circular(35.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(26.0.sp),
                                  child: CircleAvatar(
                                    backgroundColor: kicon2Color,
                                    child: GestureDetector(
                                      onTap: () =>
                                          Navigator.pushReplacementNamed(
                                              context, Chats.id),
                                      child: Stack(
                                        children: [
                                          Icon(
                                            Icons.notifications,
                                            color: Colors.white,
                                            size: 20.sp,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            height: 5.h,
                                            width: 5.w,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: Text(
                                    '، مرحباً\nأهلاَ بك',
                                    style: TextStyle(
                                      fontFamily: 'rubik',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0.sp, right: 40.sp, top: 8.sp),
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.0.sp),
                                  child: TextFormField(
                                    cursorColor: Colors.grey[400],
                                    controller:
                                        fieldProvider.searchHomeController,
                                    style: TextStyle(
                                      fontFamily: 'rubik',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.only(right: 8.0.sp),
                                        child: Icon(
                                          CupertinoIcons.search,
                                          color: Colors.grey[400],
                                          size: 30.sp,
                                        ),
                                      ),
                                    ),
                                    autofocus: false,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45.r),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Padding(
                          padding: EdgeInsets.only(right: 30.0.sp),
                          child: Text(
                            'استكشف',
                            style: TextStyle(
                              fontFamily: 'rubik',
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8.sp,
                        top: 16.sp,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomStack(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, Community.id),
                            title: 'المجتمع',
                            imagePath: 'assets/images/community.png',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CustomStack(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, AppointmentsPage.id),
                            title: 'قاعة الاجتماعات',
                            imagePath: 'assets/images/meetings room.png',
                          ),
                          // CustomStack no longer requires parameters
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.sp, top: 16.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomStack(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, AppointmentsPage.id),
                            imagePath: 'assets/images/virtual classes.png',
                            title: 'المنصة التعليمية',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          // CustomStack no longer requires parameters
                          CustomStack(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, AppointmentsPage.id),
                            title: 'الصفوف الافتراضية',
                            imagePath: 'assets/images/virtual_classes.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    BottomNavigationBarCustom(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
