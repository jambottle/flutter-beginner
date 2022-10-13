import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> requestPermission() async {
    NotificationSettings prevSettings =
        await messaging.getNotificationSettings();

    print('User granted permission: ${prevSettings.authorizationStatus}');

    if (prevSettings.authorizationStatus == AuthorizationStatus.notDetermined) {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      print('User granted permission: ${settings.authorizationStatus}');
    }
  }
}
