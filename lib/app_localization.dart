import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'my_material_app.dart';

class AppLocalization extends StatelessWidget {
  const AppLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/locals',
      // startLocale: Locale('en'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      fallbackLocale: const Locale('en'),
      child: const MyMaterialApp(),
    );
  }
}
