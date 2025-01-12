import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandler {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationHandler(this.flutterLocalNotificationsPlugin);

  Future<void> initialize() async {
    // Define initialization settings for Android, iOS, and other platforms
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings(
          'app_icon'), // Replace with your app's icon
      iOS: IOSInitializationSettings(),
    );

    // Initialize the plugin
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        // Handle the notification payload (e.g., navigate to a specific screen)
        print('Notification clicked! Payload: $payload');
      },
    );

    // Listen to Firebase messaging for foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground message
      final sound = message.data['custom_sound'];
      final icon = message.data['custom_icon'];
      print('Sound: $sound, Icon: $icon');
      // Custom sound and icon can be applied here
    });
  }

  Future<void> showNotification(int id, String title, String body) async {
    // Show a notification when called
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          channelDescription: 'your_channel_description',
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound(
              'your_custom_sound'), // Custom sound
          icon: 'app_icon', // Custom icon
        ),
      ),
      payload: 'Item 1', // Payload for the notification click action
    );
  }
}
