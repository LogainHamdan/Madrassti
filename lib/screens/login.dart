import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/screens/join.dart';
import 'package:finalproject/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/custom_elevated_button.dart';
import '../providers/fields.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_textform_field.dart';
import 'home.dart';
import 'forgot-password.dart';

class Login extends StatelessWidget {
  static const String id = '/login';
  final int selectedTab;

  const Login({Key? key, required this.selectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FieldProvider('')),
        ChangeNotifierProvider(create: (_) => ButtonProvider('تسجيل الدخول')),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildFormFields(context),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(
                    context, ForgotPassScreen.id),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      'نسيت كلمة المرور ؟',
                      style: TextStyle(
                          color: orangeColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'rubik'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Consumer<FieldProvider>(
                builder: (context, fieldProvider, _) {
                  return CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, JoinScreen.id),
                  child: Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      color: orangeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields(BuildContext context) {
    final fieldProvider = context.read<FieldProvider>();

    return Column(
      children: [
        CustomTextformField(
          isPass: false,
          controller: fieldProvider.emailLoginController,
          labelText: 'البريد الإلكتروني',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'قم بإدخال بريدك الإلكتروني';
            }
            return null;
          },
        ),
        SizedBox(height: 15),
        CustomTextformField(
          isPass: true,
          controller: fieldProvider.passLoginController,
          labelText: 'كلمة المرور',
        ),
      ],
    );
  }
}
