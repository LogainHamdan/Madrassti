import 'package:finalproject/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../providers/custom_elevated_button.dart';
import '../providers/fields.dart';
import 'custom_textform_field.dart';

class BuildFormFields extends StatelessWidget {

  const BuildFormFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

