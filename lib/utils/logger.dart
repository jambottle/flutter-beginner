import 'package:flutter/foundation.dart';

class Logger {
  static void info(Object object) {
    if (kDebugMode) {
      print('[🆗] [${DateTime.now()}] $object');
    }
  }

  static void error(Object object) {
    if (kDebugMode) {
      error('[🆖] [${DateTime.now()}] $object');
    }
  }
}
