import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utils/logger.dart';

class AppDynamicLinksController extends GetxController {
  static AppDynamicLinksController get to => Get.find();

  final FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  Future<void> initialize(BuildContext context) async {
    /* Terminated State */
    final PendingDynamicLinkData? initialLink =
        await dynamicLinks.getInitialLink();

    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      Navigator.pushNamed(context, deepLink.path);
    }

    /* Backgroun or Foreground State */
    dynamicLinks.onLink.listen((dynamicLinkData) {
      Navigator.pushNamed(context, dynamicLinkData.link.path);
    }).onError((error) {
      Logger.error('onLink error: ${error.message}');
    });
  }
}
