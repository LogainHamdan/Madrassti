import 'package:finalproject/screens/join.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/util/constants.dart';
import 'login.dart';

class OnboardingScreen extends StatelessWidget {
  static const String id = '/on';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 60.0.sp, left: 20.sp, right: 20.sp),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            40.r), // Adjust radius for circular shape
                        child: Image.asset(
                          'assets/images/splash.jpg',
                          height: 500.h,
                          width: 600.w,
                          fit: BoxFit.cover, // Ensures the image fits nicely
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.sp, left: 20.sp),
                      child: Image.asset(
                        'assets/images/logo.png',
                        alignment: Alignment.topLeft,
                        height: 120.h,
                        width: 120.w,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 26.h,
                ),
                Center(
                  child: Text(
                    'هيا نبدأ بالتعلّم',
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'rubik',
                        color: Colors.black),
                  ),
                ),
                Center(
                  child: Text(
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w200,
                          fontSize: 15.sp,
                          fontFamily: 'rubik'),
                      'مع منصة مدرستي أصبح بإمكان جميع الطلبة في كل\n'
                      '                مكان للتعلم في أي وقت'),
                ),
                SizedBox(
                  height: 46.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0.sp),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size(300.sp, 50.sp)),
                        elevation: WidgetStatePropertyAll(10.sp),
                        backgroundColor:
                            MaterialStatePropertyAll(kprimaryColor),
                        shadowColor: MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, JoinScreen.id),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_sharp,
                            size: 15.sp,
                            weight: 80,
                            color: Colors.white,
                          ),
                          Text(
                            'هيا نبدأ',
                            style: TextStyle(
                                fontFamily: 'rubik',
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
