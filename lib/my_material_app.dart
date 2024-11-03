import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/util/constants.dart';
import 'screens/onboarding-welcome.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: Locale('en'),
          title: 'Madrassti',
          theme: ThemeData(
            fontFamily: 'Poppins',
            iconTheme: const IconThemeData(color: Color(0xffB2B2B2)),
            textTheme: TextTheme(
                bodySmall: GoogleFonts.poppins(
                    color: const Color(0xffB2B2B2), fontSize: 12),
                bodyMedium: GoogleFonts.poppins(
                    color: const Color(0xff272727), fontSize: 18)),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF7F6FF)),
            scaffoldBackgroundColor: const Color(0xffF7F6FF),
            colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
            // useMaterial3: true,
          ),
          home: const OnboardingScreen(),
          routes: {},
        );
      },
      child: OnboardingScreen(),
    );
  }
}
