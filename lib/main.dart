import 'package:finalproject/firebase_options.dart';
import 'package:finalproject/providers/custom_elevated_button.dart';
import 'package:finalproject/providers/fields.dart';
import 'package:finalproject/providers/stack_provider.dart';
import 'package:finalproject/screens/notification-handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'my_material_app.dart';
import 'providers/bottom_nav.dart';
import 'providers/nav_item.dart';
import 'providers/text_field.dart';

////
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling background message: ${message.notification?.title}');
}

Future<void> main() async {
  ////
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  NotificationHandler notificationHandler =
      NotificationHandler(flutterLocalNotificationsPlugin);
  await notificationHandler.initialize(); // Initialize the notification handler
  runApp(MyApp(
      flutterLocalNotificationsPlugin:
          flutterLocalNotificationsPlugin)); // Pass plugin to the app
}

class MyApp extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  MyApp({super.key, required this.flutterLocalNotificationsPlugin});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider<NavigationProvider>(
                  create: (context) => NavigationProvider()),
              ChangeNotifierProvider<CustomStackProvider>(
                  create: (context) =>
                      CustomStackProvider(Image.asset(''), '')),
              ChangeNotifierProvider<ButtonProvider>(
                  create: (context) => ButtonProvider('')),
              ChangeNotifierProvider<FieldProvider>(
                  create: (context) => FieldProvider('')),
              ChangeNotifierProvider<BottomNavItemProvider>(
                  create: (context) => BottomNavItemProvider()),
              ChangeNotifierProvider<TextFieldProvider>(
                  create: (context) => TextFieldProvider()),
            ],
            child: MyMaterialApp(
              flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
            ));
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
