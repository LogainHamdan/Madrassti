import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/util/constants.dart';

class AppointmentCard extends StatelessWidget {
  final String name;
  final String time;
  final String description;
  final String img;

  const AppointmentCard({
    Key? key,
    required this.name,
    required this.time,
    required this.description,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Container(
          height: 150.h,
          width: MediaQuery.sizeOf(context).width.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: kiconColor.withOpacity(0.3),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 25.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(img),
                              fit: BoxFit
                                  .cover, // Ensures the image fits within the circle
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: ksecondaryColor,
                            fontFamily: 'Poppines',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontFamily: 'Poppines',
                        color: ksecondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0.sp, right: 16.sp),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Text(
                      style: TextStyle(
                        fontFamily: 'Poppines',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      description,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
