import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/util/constants.dart';
import '../providers/text_field.dart';

class CustomTextformField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPass;

  const CustomTextformField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.isPass,
  }) : super(key: key);

  @override
  State<CustomTextformField> createState() => _CustomTextformFieldState();
}

class _CustomTextformFieldState extends State<CustomTextformField> {
  late bool _obsecure;

  @override
  void initState() {
    super.initState();
    _obsecure =
        widget.isPass; // Initialize based on whether the field is a password
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TextFieldProvider>(
      builder: (context, provider, _) {
        return TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPass ? _obsecure : false, // Toggle visibility
          onChanged: (value) {
            provider.updateText(value);
            provider.validateText(value, widget.validator ?? (v) => null);
          },
          style:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          decoration: InputDecoration(
            suffixIcon: widget.isPass
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obsecure = !_obsecure; // Toggle visibility
                      });
                    },
                    child: Text(
                      _obsecure ? 'أظهر' : 'إخفاء',
                      style: TextStyle(
                          color: orangeColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                : null,
            labelText: widget.labelText,
            labelStyle: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
            errorText: provider.error, // Show error text if validation fails
          ),
        );
      },
    );
  }
}
