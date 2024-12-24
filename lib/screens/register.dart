import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/custom_elevated_button.dart';
import '../providers/fields.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_textform_field.dart';
import 'home.dart';

class Register extends StatelessWidget {
  static const String id = '/register';
  final int selectedTab;

  const Register({Key? key, required this.selectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FieldProvider('')),
        ChangeNotifierProvider(create: (_) => ButtonProvider('إنشاء حساب')),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildFormFields(context),
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
          controller: fieldProvider.firstNameController,
          labelText: 'الاسم الأول',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'قم بإدخال اسمك الأول';
            }
            return null;
          },
        ),
        SizedBox(height: 15),
        CustomTextformField(
          isPass: false,
          controller: fieldProvider.surnameController,
          labelText: 'اسم العائلة',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'قم بإدخال اسم العائلة';
            }
            return null;
          },
        ),
        SizedBox(height: 15),
        CustomTextformField(
          isPass: false,
          controller: fieldProvider.userNameController,
          labelText: 'اسم المستخدم',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'قم بإدخال اسم المستخدم';
            }
            return null;
          },
        ),
        SizedBox(height: 15),
        CustomTextformField(
          isPass: false,
          controller: fieldProvider.emailRegController,
          labelText: 'البريد الإلكتروني',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'قم بإدخال بريدك الإلكتروني';
            }
            return null;
          },
        ),
        SizedBox(height: 8),
        CustomTextformField(
          isPass: false,
          controller: fieldProvider.numberController,
          labelText: 'رقم الهاتف',
        ),
        SizedBox(height: 8),
        CustomTextformField(
          isPass: true,
          controller: fieldProvider.passRegController,
          labelText: 'كلمة المرور',
        ),
        SizedBox(height: 16),
        CustomTextformField(
          isPass: true,
          controller: fieldProvider.confPassController,
          labelText: 'تأكيد كلمة المرور',
        ),
      ],
    );
  }
}
