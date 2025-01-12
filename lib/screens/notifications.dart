import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationHomePage extends StatefulWidget {
  static const id = '/notification';
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  const NotificationHomePage(
      {Key? key, required this.flutterLocalNotificationsPlugin})
      : super(key: key);

  @override
  _NotificationHomePageState createState() => _NotificationHomePageState();
}

class _NotificationHomePageState extends State<NotificationHomePage> {
  String _message = "No notifications received yet.";

  @override
  void initState() {
    super.initState();

    // Initialize Firebase Messaging and listen for background and foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _message =
            "Notification received: ${message.notification?.title ?? ''}";
      });

      // Show notification locally when in foreground
      _showLocalNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      setState(() {
        _message = "Notification clicked: ${message.notification?.title ?? ''}";
      });
    });
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      icon: 'app_icon',
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await widget.flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
      payload: 'Notification Payload',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notification Status: $_message',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Trigger a notification when button is pressed
                await _triggerNotification();
              },
              child: const Text('Trigger Notification'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _triggerNotification() async {
    await widget.flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Hello from Firebase!', // Notification Title
      'This is a test notification', // Notification Body
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id', // Channel ID
          'your_channel_name', // Channel Name
          channelDescription: 'your_channel_description', // Channel description
          importance: Importance.max, // Notification Importance
          priority: Priority.high, // Notification Priority
          icon: 'app_icon', // Custom icon for notification
        ),
      ),
      payload: 'Test Notification Payload', // Payload for click action
    );
  }
}
