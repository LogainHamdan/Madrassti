import 'package:finalproject/screens/apointments.dart';
import 'package:finalproject/screens/community.dart';
import 'package:finalproject/screens/meetings-room.dart';
import 'package:finalproject/screens/notifications.dart';
import 'package:finalproject/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/chats.dart';
import 'screens/home.dart';
import 'screens/onboarding-welcome.dart';
import 'screens/join.dart';
import 'screens/register.dart';
import 'screens/login.dart';
import 'core/util/constants.dart';

class MyMaterialApp extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  const MyMaterialApp(
      {super.key, required this.flutterLocalNotificationsPlugin});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Your design's screen size
      minTextAdapt: true,
      builder: (ctx, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'مدرستي',
          theme: ThemeData(
            fontFamily: 'rubik',
            iconTheme: const IconThemeData(color: Color(0xffB2B2B2)),
            textTheme: TextTheme(
              bodySmall: TextStyle(
                  color: const Color(0xffB2B2B2),
                  fontSize: 12.sp,
                  fontFamily: 'rubik'),
              bodyMedium: TextStyle(
                fontFamily: 'rubik',
                color: const Color(0xff272727),
                fontSize: 18.sp,
              ),
            ),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF7F6FF)),
            scaffoldBackgroundColor: const Color(0xffF7F6FF),
            colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
          ),
          initialRoute: OnboardingScreen.id,
          routes: {
            OnboardingScreen.id: (context) => const OnboardingScreen(),
            AppointmentsPage.id: (context) => const AppointmentsPage(),
            HomePage.id: (context) => const HomePage(),
            JoinScreen.id: (context) => const JoinScreen(),
            Login.id: (context) => const Login(selectedTab: 1),
            Register.id: (context) => const Register(selectedTab: 0),
            Chats.id: (context) => const Chats(),
            Community.id: (context) => Community(),
            Profile.id: (context) => const Profile(),
            MeetingsRoomScreen.id: (context) => MeetingsRoomScreen(),
            NotificationHomePage.id: (context) => NotificationHomePage(
                  flutterLocalNotificationsPlugin:
                      flutterLocalNotificationsPlugin,
                ),
          },
        );
      },
    );
  }
}
