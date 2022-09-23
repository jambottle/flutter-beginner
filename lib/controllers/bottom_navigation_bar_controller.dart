import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  static BottomNavigationBarController get to => Get.find();

  final selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
