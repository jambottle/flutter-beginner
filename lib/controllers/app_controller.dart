import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> requestPermission() async {
    NotificationSettings prevSettings =
        await messaging.getNotificationSettings();

    print(
        '[FlutterFire🔥] Granted permission: ${prevSettings.authorizationStatus}');

    if (prevSettings.authorizationStatus == AuthorizationStatus.notDetermined) {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      print(
          '[FlutterFire🔥] Granted permission: ${settings.authorizationStatus}');
    }
  }

  // Use the returned token to send messages to users from your custom server
  Future<void> getToken() async {
    String? token;

    if (Platform.isAndroid) {
      token = await messaging.getToken(
        vapidKey:
            'BBfPDzEPXXNFJeGfQwIZ-Hy1Mwy9ccjGQlWBHZZxrEWADstoKaGIgLPWdvMOKt4Xkkq_Ok2Ra5WIa_TL0ZUxR8U',
      );

      print('[FlutterFire🔥] Got GCM token: $token');
    } else if (Platform.isIOS) {
      token = await messaging.getAPNSToken();

      print('[FlutterFire🔥] Got APNs token: $token');
    }
  }

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<void> setupNotifications() async {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // name
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Initialize the Flutter Local Notifications Plugin package
    await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );

    if (Platform.isAndroid) {
      // Create an Android Notification Channel for heads up notifications
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    } else if (Platform.isIOS) {
      // Set the iOS Notification Options for heads up notifications
      await messaging.setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );
    }
  }

  void showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'launch_background',
          ),
          iOS: DarwinNotificationDetails(),
        ),
      );
    }
  }
}
