import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/home_page.dart';

class BottomNavigationBarController extends GetxController {
  static BottomNavigationBarController get to => Get.find();

  final currentIndex = 0.obs;

  List<Widget> pages = [
    HomePage(),
    Text('Search'),
    Text('Account'),
  ];

  Widget get currentPage => pages[currentIndex.value];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
