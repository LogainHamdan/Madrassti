import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/custom_elevated_button.dart';
import '../providers/fields.dart';
import '../widgets/build-form-fields.dart';
import '../widgets/code-container.dart';
import '../widgets/custom_elevated_button.dart';
import 'home.dart';
import 'join.dart';

class Login extends StatefulWidget {
  static const String id = '/login';
  final int selectedTab;

  const Login({Key? key, required this.selectedTab}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isForgotton = false; // Manage the state here
  late TabController tabController;
  List<int> getCodeNums = [8, 5, 0, 4];

  @override
  Widget build(BuildContext context) {
    final List<int> codeNums = getCodeNums;

    return !isForgotton // Check the value of isForgotton
        ? MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => FieldProvider('')),
              ChangeNotifierProvider(
                  create: (_) => ButtonProvider('إنشاء حساب')),
            ],
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    BuildFormFields(),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isForgotton = true; // Change the state
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text(
                            'نسيت كلمة المرور؟',
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Consumer<FieldProvider>(
                      builder: (context, fieldProvider, _) {
                        return CustomElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, HomePage.id);
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, JoinScreen.id),
                        child: Text(
                          'إنشاء حساب',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          )
        : MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => FieldProvider('')),
              ChangeNotifierProvider(
                  create: (_) => ButtonProvider('تسجيل الدخول'))
            ],
            child: Column(
              children: [
                Text(
                  'كود التفعيل',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'ضع 4 أرقام التي وصلتك على البريد الإلكتروني',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w200,
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  'أدخل اسم المستخدم وكلمة المرور',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CodeContainer(num: codeNums[0]),
                    CodeContainer(num: codeNums[1]),
                    CodeContainer(num: codeNums[2]),
                    CodeContainer(num: codeNums[3]),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<FieldProvider>(
                  builder: (context, fieldProvider, _) {
                    return CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, HomePage.id);
                      },
                    );
                  },
                ),
              ],
            ),
          );
  }
}
