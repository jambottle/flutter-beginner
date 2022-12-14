import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/app_controller.dart';
import 'controllers/app_dynamic_links_controller.dart';
import 'controllers/bottom_navbar_controller.dart';
import 'firebase_options.dart';
import 'global_scaffold.dart';
import 'utils/logger.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  /* Global Controller */
  final AppController appController = Get.put(AppController());

  // If you're going to use other Firebase services in the background,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await appController.setupNotifications();
  appController.showNotification(message);

  Logger.info('[FlutterFire🔥] Background message ID: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get a Firebase Remote Config object instance
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  // Set the minimum fetch interval to allow for frequent refreshes
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(minutes: 5),
  ));

  // Set in-app default parameter values if none are set in the backend
  await remoteConfig.setDefaults(const {
    "example_param_1": 42,
    "example_param_2": 3.14159,
    "example_param_3": true,
    "example_param_4": "Hello, world!",
  });

  // Fetch values from the backend and Make them available to the app
  await remoteConfig.fetchAndActivate();

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
  /* Global Controller */
  final AppController appController = Get.put(AppController());
  final AppDynamicLinksController appDynamicLinksController =
      Get.put(AppDynamicLinksController());

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

      Logger.info('[FlutterFire🔥] Foreground message data: ${message.data}');

      if (message.notification != null) {
        Logger.info(
            '[FlutterFire🔥] Foreground message also contained a notification: ${message.notification}');
      }
    });

    // Handle Firebase Dynamic Links using GetxController
    appDynamicLinksController.initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GlobalScaffold(),
      initialBinding: BindingsBuilder.put(
        () => BottomNavbarController(),
        permanent: true,
      ),
    );
  }
}
