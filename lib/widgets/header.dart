import 'package:finalproject/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/util/constants.dart';

class Header extends StatelessWidget {
  Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(1, 1),
                blurRadius: 8.0.r,
                spreadRadius: 2.r,
              ),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.blue[100],
              size: 20.sp,
            ),
          ),
        ),
        Text(
          'المجتمع',
          style: TextStyle(
            color: orangeColor,
            fontFamily: 'rubik',
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, HomePage.id),
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: kprimaryColor,
          ),
        ),
      ],
    );
  }
}
