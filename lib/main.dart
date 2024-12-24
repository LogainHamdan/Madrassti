import 'package:finalproject/providers/custom_elevated_button.dart';
import 'package:finalproject/providers/fields.dart';
import 'package:finalproject/providers/stack_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'my_material_app.dart';
import 'providers/bottom_nav.dart';
import 'providers/nav_item.dart';
import 'providers/text_field.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiProvider(providers: [
          ChangeNotifierProvider<NavigationProvider>(
              create: (context) => NavigationProvider()),
          ChangeNotifierProvider<CustomStackProvider>(
              create: (context) => CustomStackProvider(Image.asset(''), '')),
          ChangeNotifierProvider<ButtonProvider>(
              create: (context) => ButtonProvider('')),
          ChangeNotifierProvider<FieldProvider>(
              create: (context) => FieldProvider('')),
          ChangeNotifierProvider<BottomNavItemProvider>(
              create: (context) => BottomNavItemProvider()),
          ChangeNotifierProvider<TextFieldProvider>(
              create: (context) => TextFieldProvider()),
        ], child: MyMaterialApp());
      },
    );
  }
}

// ScreenUtilInit(
// designSize: const Size(360, 690),
// minTextAdapt: true,
// splitScreenMode: true,
// builder: (_, child) => const OnboardingScreen(),
// ),
// EasyLocalization(
//   supportedLocales: [
//     Locale('en', 'US'),
//     Locale('ar', 'EG')
//   ], // Add other supported locales as needed
//   path: 'assets/translations', // Path to your translation files
//   fallbackLocale: Locale('en', 'US'),
//   child: const MyApp(),
