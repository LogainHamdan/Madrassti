import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/util/constants.dart';

class NavigationContainer extends StatefulWidget {
  NavigationContainer({
    super.key,
  });

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 70.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                // Lighter shadow with some transparency
                offset: Offset(0.0, 0.1),
                // Slightly stronger offset for better depth
                blurRadius: 8.0.r,
                // Makes the shadow blur out
                spreadRadius: 2.0.r,
              )
            ]),
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      CupertinoIcons.group_solid,
                      color: kprimaryColor,
                    ),
                    Text(
                      'المجتمع',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.tag_outlined,
                      color: kprimaryColor,
                    ),
                    Text(
                      'المنصة',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.class_outlined,
                      color: kprimaryColor,
                    ),
                    Text(
                      'الصفوف',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.tv,
                      color: kprimaryColor,
                    ),
                    Text(
                      'الاجتماعات',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
