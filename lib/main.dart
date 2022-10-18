import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/app_controller.dart';
import 'firebase_options.dart';
import 'global_scaffold.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  /* Global State */
  final AppController appController = Get.put(AppController());

  // If you're going to use other Firebase services in the background,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await appController.setupNotifications();
  appController.showNotification(message);

  print('[FlutterFire🔥] Background message ID: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /* Global State */
  final AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    if (!Platform.isAndroid) {
      appController.requestPermission();
    }

    if (!kIsWeb) {
      appController.getToken();
      appController.setupNotifications();
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      appController.showNotification(message);

      print('[FlutterFire🔥] Foreground message data: ${message.data}');

      if (message.notification != null) {
        print(
            '[FlutterFire🔥] Foreground message also contained a notification: ${message.notification}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GlobalScaffold(),
    );
  }
}
