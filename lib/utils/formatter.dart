import 'package:intl/intl.dart';

class Formatter {
  static String getComma(int number) {
    final f = NumberFormat('###,###,###');

    return f.format(number);
  }
}
