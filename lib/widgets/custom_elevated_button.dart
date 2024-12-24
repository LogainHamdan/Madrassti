import 'package:finalproject/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/custom_elevated_button.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonProvider = context.watch<ButtonProvider>();

    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(300, 50)),
        elevation: MaterialStateProperty.all(10),
        backgroundColor: MaterialStateProperty.all(
          kprimaryColor,
        ),
        shadowColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonProvider.buttonText,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
