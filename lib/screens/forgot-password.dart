import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassScreen extends StatelessWidget {
  static const id = '/forgot';
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(child: const Placeholder());
  }
}
